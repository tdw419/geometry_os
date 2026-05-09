; DESCRIPTION: Places a black 63x13 rectangle at position (316, 134).
; PLAN: r0=316(x), r1=134(y), r2=63(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 134
LDI r2, 63
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
