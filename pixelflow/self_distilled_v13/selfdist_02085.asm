; DESCRIPTION: Places a orange disk with center (116, 82) and radius 66.
; PLAN: r0=116(x), r1=82(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 82
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
