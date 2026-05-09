; DESCRIPTION: Renders a yellow box of size 78x96 starting at (328, 130).
; PLAN: r0=328(x), r1=130(y), r2=78(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 130
LDI r2, 78
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
