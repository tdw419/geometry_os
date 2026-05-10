; DESCRIPTION: Places a red disk with center (258, 172) and radius 36.
; PLAN: r0=258(x), r1=172(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 172
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
