; DESCRIPTION: Places a magenta disk with center (91, 132) and radius 14.
; PLAN: r0=91(x), r1=132(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 132
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
