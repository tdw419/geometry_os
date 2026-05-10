; DESCRIPTION: Renders a orange disk with center (378, 166) and radius 79.
; PLAN: r0=378(x), r1=166(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 166
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
