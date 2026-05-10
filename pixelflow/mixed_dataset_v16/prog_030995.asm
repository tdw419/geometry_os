; DESCRIPTION: Places a red disk with center (389, 176) and radius 64.
; PLAN: r0=389(x), r1=176(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 176
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
