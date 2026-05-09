; DESCRIPTION: Renders a orange disk with center (154, 105) and radius 79.
; PLAN: r0=154(x), r1=105(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 105
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
