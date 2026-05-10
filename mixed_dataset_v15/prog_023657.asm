; DESCRIPTION: Places a magenta disk with center (132, 135) and radius 18.
; PLAN: r0=132(x), r1=135(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 135
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
