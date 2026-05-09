; DESCRIPTION: Renders a orange disk with center (83, 44) and radius 42.
; PLAN: r0=83(x), r1=44(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 44
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
