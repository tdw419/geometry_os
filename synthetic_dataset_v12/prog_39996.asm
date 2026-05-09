; DESCRIPTION: Places a red circle of radius 43 at center (419, 206).
; PLAN: r0=419(x), r1=206(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 206
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
