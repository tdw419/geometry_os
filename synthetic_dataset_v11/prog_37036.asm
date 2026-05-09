; DESCRIPTION: Places a red circle of radius 15 at center (84, 135).
; PLAN: r0=84(x), r1=135(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 135
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
