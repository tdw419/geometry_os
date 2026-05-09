; DESCRIPTION: Places a black 114x84 rectangle at position (283, 88).
; PLAN: r0=283(x), r1=88(y), r2=114(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 88
LDI r2, 114
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
