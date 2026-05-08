; DESCRIPTION: Display a object using color colored at the screen.

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
    LDI r12, 0x000011
    FILL r12

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r9, 10
    STORE r20, r9
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r9, 10
    STORE r20, r9
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r13, 0x6000        ; text pointer
    LDI r8, 0             ; match count
    LDI r15, 1

search_loop:
    ; Read char at text pointer
    LOAD r9, r13
    ; Check for null (end of text)
    LDI r2, 0
    CMP r9, r2
    JZ r14, search_done

    ; Try to match pattern at this position
    LDI r1, 0x6100        ; pattern pointer
    MOV r16, r13            ; save start position

match_try:
    ; Read pattern char
    LOAD r9, r1
    ; If pattern char is null, full match
    LDI r2, 0
    CMP r9, r2
    JZ r14, found_match

    ; Read text char at current position
    LOAD r3, r16
    ; If text is null or newline, no match
    LDI r2, 0
    CMP r3, r2
    JZ r14, no_match

    ; Compare
    CMP r9, r3
    JNZ r14, no_match

    ; Match so far, advance both
    ADD r1, r15
    ADD r16, r15
    JMP match_try

found_match:
    ADDI r8, 1            ; match count++

no_match:
    ADDI r13, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r11, 0x7800
    STORE r11, r8

    ; --- Draw header ---
    LDI r12, 0x006600       ; green header
    LDI r1, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r12

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r13, 4
    LDI r8, 2
    LDI r6, 0x5000
    LDI r7, 0xFFFFFF
    LDI r4, 0x006600
    DRAWTEXT r13, r8, r6, r7, r4

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r13, 4
    LDI r8, 16
    LDI r6, 0x5000
    LDI r7, 0xCCCCCC
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r6, r7, r4

    ; Show the pattern itself
    LDI r13, 80
    LDI r8, 16
    LDI r6, 0x6100
    LDI r7, 0xFFFF00     ; yellow
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r6, r7, r4

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r13, 4
    LDI r8, 32
    LDI r6, 0x5000
    LDI r7, 0xCCCCCC
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r6, r7, r4

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r13, 4
    LDI r8, 48
    LDI r6, 0x5000
    LDI r7, 0xCCCCCC
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r6, r7, r4

    LDI r13, 50
    LDI r8, 48
    LDI r6, 0x6000
    LDI r7, 0x888888
    LDI r4, 0x000011
    DRAWTEXT r13, r8, r6, r7, r4

    HALT
