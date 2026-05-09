; DESCRIPTION: Places a red circle of radius 20 at center (135, 119).
; PLAN: r0=135(x), r1=119(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 119
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
