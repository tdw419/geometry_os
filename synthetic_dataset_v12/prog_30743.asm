; DESCRIPTION: Renders a blue box of size 13x19 starting at (290, 110).
; PLAN: r0=290(x), r1=110(y), r2=13(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 110
LDI r2, 13
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
