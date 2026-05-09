; DESCRIPTION: Places a black 57x13 rectangle at position (162, 114).
; PLAN: r0=162(x), r1=114(y), r2=57(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 114
LDI r2, 57
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
