; DESCRIPTION: Renders a black box of size 88x37 starting at (177, 4).
; PLAN: r0=177(x), r1=4(y), r2=88(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 4
LDI r2, 88
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
