; DESCRIPTION: Renders a orange disk with center (80, 108) and radius 32.
; PLAN: r0=80(x), r1=108(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 108
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
