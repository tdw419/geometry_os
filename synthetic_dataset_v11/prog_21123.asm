; DESCRIPTION: Places a blue circle of radius 74 at center (110, 150).
; PLAN: r0=110(x), r1=150(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 150
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
