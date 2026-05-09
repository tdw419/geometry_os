; DESCRIPTION: Renders a orange disk with center (367, 190) and radius 58.
; PLAN: r0=367(x), r1=190(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 190
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
