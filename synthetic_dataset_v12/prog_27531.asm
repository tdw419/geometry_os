; DESCRIPTION: Renders a black box of size 65x20 starting at (264, 144).
; PLAN: r0=264(x), r1=144(y), r2=65(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 144
LDI r2, 65
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
