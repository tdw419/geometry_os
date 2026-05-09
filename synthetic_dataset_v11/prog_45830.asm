; DESCRIPTION: Places a blue circle of radius 20 at center (95, 63).
; PLAN: r0=95(x), r1=63(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 63
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
