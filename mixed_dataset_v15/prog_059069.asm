; DESCRIPTION: Renders a yellow box of size 65x105 starting at (194, 54).
; PLAN: r0=194(x), r1=54(y), r2=65(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 54
LDI r2, 65
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
