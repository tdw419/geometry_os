; DESCRIPTION: Renders a black box of size 106x15 starting at (188, 49).
; PLAN: r0=188(x), r1=49(y), r2=106(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 49
LDI r2, 106
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
