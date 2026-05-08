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
    LDI r15, 0x000011
    FILL r15

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
    LDI r13, 0x6000        ; text pointer
    LDI r8, 0             ; match count
    LDI r14, 1

search_loop:
    ; Read char at text pointer
    LOAD r2, r13
    ; Check for null (end of text)
    LDI r10, 0
    CMP r2, r10
    JZ r5, search_done

    ; Try to match pattern at this position
    LDI r9, 0x6100        ; pattern pointer
    MOV r16, r13            ; save start position

match_try:
    ; Read pattern char
    LOAD r2, r9
    ; If pattern char is null, full match
    LDI r10, 0
    CMP r2, r10
    JZ r5, found_match

    ; Read text char at current position
    LOAD r11, r16
    ; If text is null or newline, no match
    LDI r10, 0
    CMP r11, r10
    JZ r5, no_match

    ; Compare
    CMP r2, r11
    JNZ r5, no_match

    ; Match so far, advance both
    ADD r9, r14
    ADD r16, r14
    JMP match_try

found_match:
    ADDI r8, 1            ; match count++

no_match:
    ADDI r13, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r6, 0x7800
    STORE r6, r8

    ; --- Draw header ---
    LDI r15, 0x006600       ; green header
    LDI r9, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r15

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r13, 4
    LDI r8, 2
    LDI r7, 0x5000
    LDI r1, 0xFFFFFF
    LDI r4, 0x006600
    DRAWTEXT r13, r8, r7, r1, r4

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r13, 4
    LDI r8, 16
    LDI r7, 0x5000
    LDI r1, 0xCCCCCC
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r7, r1, r4

    ; Show the pattern itself
    LDI r13, 80
    LDI r8, 16
    LDI r7, 0x6100
    LDI r1, 0xFFFF00     ; yellow
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r7, r1, r4

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r13, 4
    LDI r8, 32
    LDI r7, 0x5000
    LDI r1, 0xCCCCCC
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r7, r1, r4

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r13, 4
    LDI r8, 48
    LDI r7, 0x5000
    LDI r1, 0xCCCCCC
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r7, r1, r4

    LDI r13, 50
    LDI r8, 48
    LDI r7, 0x6000
    LDI r1, 0x888888
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r7, r1, r4

    HALT
