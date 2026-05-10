; DESCRIPTION: Places a blue circle of radius 48 at center (91, 107).
; PLAN: r0=91(x), r1=107(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 107
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
