; DESCRIPTION: Places a blue circle of radius 12 at center (428, 16).
; PLAN: r0=428(x), r1=16(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 16
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
