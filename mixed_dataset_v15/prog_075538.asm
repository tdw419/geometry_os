; DESCRIPTION: Renders a orange disk with center (214, 118) and radius 75.
; PLAN: r0=214(x), r1=118(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 118
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
