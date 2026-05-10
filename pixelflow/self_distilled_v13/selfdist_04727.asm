; DESCRIPTION: Places a blue disk with center (45, 149) and radius 59.
; PLAN: r0=45(x), r1=149(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 149
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
