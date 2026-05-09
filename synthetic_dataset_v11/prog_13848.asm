; DESCRIPTION: Renders a black box of size 49x97 starting at (63, 64).
; PLAN: r0=63(x), r1=64(y), r2=49(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 64
LDI r2, 49
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
