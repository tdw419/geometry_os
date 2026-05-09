; DESCRIPTION: Places a red circle of radius 69 at center (71, 180).
; PLAN: r0=71(x), r1=180(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 180
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
