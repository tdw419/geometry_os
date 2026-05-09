; DESCRIPTION: Renders a black box of size 35x15 starting at (97, 94).
; PLAN: r0=97(x), r1=94(y), r2=35(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 94
LDI r2, 35
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
