; DESCRIPTION: Places a black 19x88 rectangle at position (135, 129).
; PLAN: r0=135(x), r1=129(y), r2=19(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 129
LDI r2, 19
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
