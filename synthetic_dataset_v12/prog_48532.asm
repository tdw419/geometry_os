; DESCRIPTION: Places a red circle of radius 33 at center (278, 180).
; PLAN: r0=278(x), r1=180(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 180
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
