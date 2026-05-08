; DESCRIPTION: Draws a colored object at the screen with fixed size.

; grep.asm -- Search for a pattern in RAM text
;
; Searches for all occurrences of a byte pattern in a text buffer.
; Pattern is pre-loaded at 0x6100, text at 0x6000.
; Outputs match count at RAM[0x7800].
; Displays matches on screen with highlighted text.
;
; Sample: search for "oo" in "Hello World\nFoo Bar\nBaz"
; Expected: 1 match (in "F[oo] Bar")

    ; --- Fill screen ---
    LDI r15, 0x000011
    FILL r15

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r6, 10
    STORE r20, r6
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r6, 10
    STORE r20, r6
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r3, 0x6000        ; text pointer
    LDI r7, 0             ; match count
    LDI r10, 1

search_loop:
    ; Read char at text pointer
    LOAD r6, r3
    ; Check for null (end of text)
    LDI r0, 0
    CMP r6, r0
    JZ r1, search_done

    ; Try to match pattern at this position
    LDI r5, 0x6100        ; pattern pointer
    MOV r16, r3            ; save start position

match_try:
    ; Read pattern char
    LOAD r6, r5
    ; If pattern char is null, full match
    LDI r0, 0
    CMP r6, r0
    JZ r1, found_match

    ; Read text char at current position
    LOAD r4, r16
    ; If text is null or newline, no match
    LDI r0, 0
    CMP r4, r0
    JZ r1, no_match

    ; Compare
    CMP r6, r4
    JNZ r1, no_match

    ; Match so far, advance both
    ADD r5, r10
    ADD r16, r10
    JMP match_try

found_match:
    ADDI r7, 1            ; match count++

no_match:
    ADDI r3, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r14, 0x7800
    STORE r14, r7

    ; --- Draw header ---
    LDI r15, 0x006600       ; green header
    LDI r5, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r5, r16, r17, r18, r15

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r3, 4
    LDI r7, 2
    LDI r9, 0x5000
    LDI r8, 0xFFFFFF
    LDI r2, 0x006600
    DRAWTEXT r3, r7, r9, r8, r2

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r3, 4
    LDI r7, 16
    LDI r9, 0x5000
    LDI r8, 0xCCCCCC
    LDI r2, 0x000011
    DRAWTEXT r3, r7, r9, r8, r2

    ; Show the pattern itself
    LDI r3, 80
    LDI r7, 16
    LDI r9, 0x6100
    LDI r8, 0xFFFF00     ; yellow
    LDI r2, 0x000011
    DRAWTEXT r3, r7, r9, r8, r2

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r3, 4
    LDI r7, 32
    LDI r9, 0x5000
    LDI r8, 0xCCCCCC
    LDI r2, 0x000011
    DRAWTEXT r3, r7, r9, r8, r2

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r3, 4
    LDI r7, 48
    LDI r9, 0x5000
    LDI r8, 0xCCCCCC
    LDI r2, 0x000011
    DRAWTEXT r3, r7, r9, r8, r2

    LDI r3, 50
    LDI r7, 48
    LDI r9, 0x6000
    LDI r8, 0x888888
    LDI r2, 0x000011
    DRAWTEXT r3, r7, r9, r8, r2

    HALT
