; DESCRIPTION: Places a blue circle of radius 45 at center (205, 209).
; PLAN: r0=205(x), r1=209(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 209
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
