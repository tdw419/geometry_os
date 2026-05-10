; DESCRIPTION: Places a magenta disk with center (269, 60) and radius 80.
; PLAN: r0=269(x), r1=60(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 60
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
