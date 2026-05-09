; DESCRIPTION: Places a red circle of radius 70 at center (251, 167).
; PLAN: r0=251(x), r1=167(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 167
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
