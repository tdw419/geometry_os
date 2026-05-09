; DESCRIPTION: Renders a black box of size 117x97 starting at (84, 32).
; PLAN: r0=84(x), r1=32(y), r2=117(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 32
LDI r2, 117
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
