; DESCRIPTION: Places a blue circle of radius 55 at center (450, 77).
; PLAN: r0=450(x), r1=77(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 77
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
