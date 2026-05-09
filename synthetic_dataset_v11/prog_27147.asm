; DESCRIPTION: Renders a orange disk with center (152, 150) and radius 17.
; PLAN: r0=152(x), r1=150(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 150
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
