; DESCRIPTION: Places a red disk with center (115, 186) and radius 76.
; PLAN: r0=115(x), r1=186(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 186
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
