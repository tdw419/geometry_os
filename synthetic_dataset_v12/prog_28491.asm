; DESCRIPTION: Places a blue circle of radius 36 at center (290, 220).
; PLAN: r0=290(x), r1=220(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 220
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
