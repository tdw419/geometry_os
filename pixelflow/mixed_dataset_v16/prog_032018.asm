; DESCRIPTION: Places a red circle of radius 20 at center (217, 55).
; PLAN: r0=217(x), r1=55(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 55
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
