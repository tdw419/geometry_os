; DESCRIPTION: A colored object centered at the screen with fixed size.

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
    LDI r7, 0x000011
    FILL r7

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r2, 10
    STORE r20, r2
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r2, 10
    STORE r20, r2
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r9, 0x6000        ; text pointer
    LDI r0, 0             ; match count
    LDI r11, 1

search_loop:
    ; Read char at text pointer
    LOAD r2, r9
    ; Check for null (end of text)
    LDI r3, 0
    CMP r2, r3
    JZ r10, search_done

    ; Try to match pattern at this position
    LDI r14, 0x6100        ; pattern pointer
    MOV r16, r9            ; save start position

match_try:
    ; Read pattern char
    LOAD r2, r14
    ; If pattern char is null, full match
    LDI r3, 0
    CMP r2, r3
    JZ r10, found_match

    ; Read text char at current position
    LOAD r6, r16
    ; If text is null or newline, no match
    LDI r3, 0
    CMP r6, r3
    JZ r10, no_match

    ; Compare
    CMP r2, r6
    JNZ r10, no_match

    ; Match so far, advance both
    ADD r14, r11
    ADD r16, r11
    JMP match_try

found_match:
    ADDI r0, 1            ; match count++

no_match:
    ADDI r9, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r4, 0x7800
    STORE r4, r0

    ; --- Draw header ---
    LDI r7, 0x006600       ; green header
    LDI r14, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r14, r16, r17, r18, r7

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r9, 4
    LDI r0, 2
    LDI r12, 0x5000
    LDI r1, 0xFFFFFF
    LDI r8, 0x006600
    DRAWTEXT r9, r0, r12, r1, r8

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r9, 4
    LDI r0, 16
    LDI r12, 0x5000
    LDI r1, 0xCCCCCC
    LDI r8, 0x000011
    DRAWTEXT r9, r0, r12, r1, r8

    ; Show the pattern itself
    LDI r9, 80
    LDI r0, 16
    LDI r12, 0x6100
    LDI r1, 0xFFFF00     ; yellow
    LDI r8, 0x000011
    DRAWTEXT r9, r0, r12, r1, r8

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r9, 4
    LDI r0, 32
    LDI r12, 0x5000
    LDI r1, 0xCCCCCC
    LDI r8, 0x000011
    DRAWTEXT r9, r0, r12, r1, r8

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r9, 4
    LDI r0, 48
    LDI r12, 0x5000
    LDI r1, 0xCCCCCC
    LDI r8, 0x000011
    DRAWTEXT r9, r0, r12, r1, r8

    LDI r9, 50
    LDI r0, 48
    LDI r12, 0x6000
    LDI r1, 0x888888
    LDI r8, 0x000011
    DRAWTEXT r9, r0, r12, r1, r8

    HALT
