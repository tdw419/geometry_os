; DESCRIPTION: Places a blue circle of radius 59 at center (213, 82).
; PLAN: r0=213(x), r1=82(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 82
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
