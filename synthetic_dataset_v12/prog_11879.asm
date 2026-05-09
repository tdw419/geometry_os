; DESCRIPTION: Renders a orange disk with center (378, 186) and radius 28.
; PLAN: r0=378(x), r1=186(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 186
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
