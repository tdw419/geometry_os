; DESCRIPTION: Renders a orange disk with center (450, 82) and radius 53.
; PLAN: r0=450(x), r1=82(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 82
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
