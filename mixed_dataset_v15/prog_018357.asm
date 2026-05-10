; DESCRIPTION: Places a magenta disk with center (185, 144) and radius 65.
; PLAN: r0=185(x), r1=144(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 144
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
