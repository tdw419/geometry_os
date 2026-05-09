; DESCRIPTION: Renders a green box of size 10x52 starting at (188, 109).
; PLAN: r0=188(x), r1=109(y), r2=10(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 109
LDI r2, 10
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
