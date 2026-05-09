; DESCRIPTION: Renders a orange disk with center (116, 177) and radius 40.
; PLAN: r0=116(x), r1=177(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 177
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
