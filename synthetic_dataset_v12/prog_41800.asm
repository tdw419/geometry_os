; DESCRIPTION: Renders a blue disk with center (218, 58) and radius 57.
; PLAN: r0=218(x), r1=58(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 58
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
