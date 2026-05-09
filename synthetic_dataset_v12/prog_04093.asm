; DESCRIPTION: Draws a blue circle centered at (290, 41) with radius 27.
; PLAN: r0=290(x), r1=41(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 41
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
