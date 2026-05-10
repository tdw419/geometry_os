; DESCRIPTION: Places a red disk with center (82, 172) and radius 34.
; PLAN: r0=82(x), r1=172(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 172
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
