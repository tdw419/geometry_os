; DESCRIPTION: Renders a blue box of size 62x68 starting at (290, 99).
; PLAN: r0=290(x), r1=99(y), r2=62(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 99
LDI r2, 62
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
