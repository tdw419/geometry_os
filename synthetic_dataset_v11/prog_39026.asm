; DESCRIPTION: Places a red circle of radius 65 at center (185, 124).
; PLAN: r0=185(x), r1=124(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 124
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
