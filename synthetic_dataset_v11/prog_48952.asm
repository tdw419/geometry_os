; DESCRIPTION: Renders a orange disk with center (154, 145) and radius 45.
; PLAN: r0=154(x), r1=145(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 145
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
