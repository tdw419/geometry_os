; DESCRIPTION: Places a blue circle of radius 49 at center (127, 57).
; PLAN: r0=127(x), r1=57(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 57
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
