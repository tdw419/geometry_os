; DESCRIPTION: Places a orange disk with center (177, 196) and radius 72.
; PLAN: r0=177(x), r1=196(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 196
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
