; DESCRIPTION: Renders a orange disk with center (350, 79) and radius 73.
; PLAN: r0=350(x), r1=79(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 79
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
