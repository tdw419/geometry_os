; DESCRIPTION: Renders a blue disk with center (433, 207) and radius 32.
; PLAN: r0=433(x), r1=207(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 207
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
