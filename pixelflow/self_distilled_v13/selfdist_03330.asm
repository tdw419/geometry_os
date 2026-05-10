; DESCRIPTION: Places a orange disk with center (215, 184) and radius 66.
; PLAN: r0=215(x), r1=184(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 184
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
