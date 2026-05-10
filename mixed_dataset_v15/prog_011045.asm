; DESCRIPTION: Places a red circle of radius 74 at center (315, 180).
; PLAN: r0=315(x), r1=180(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 180
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
