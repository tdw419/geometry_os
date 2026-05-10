; DESCRIPTION: Places a blue disk with center (218, 59) and radius 79.
; PLAN: r0=218(x), r1=59(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 59
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
