; DESCRIPTION: Places a magenta disk with center (302, 149) and radius 57.
; PLAN: r0=302(x), r1=149(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 149
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
