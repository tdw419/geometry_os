; DESCRIPTION: Renders a orange disk with center (178, 177) and radius 16.
; PLAN: r0=178(x), r1=177(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 177
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
