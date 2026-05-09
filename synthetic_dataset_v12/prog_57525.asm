; DESCRIPTION: Renders a green box of size 48x10 starting at (316, 130).
; PLAN: r0=316(x), r1=130(y), r2=48(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 130
LDI r2, 48
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
