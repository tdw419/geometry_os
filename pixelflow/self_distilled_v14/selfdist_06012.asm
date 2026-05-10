; DESCRIPTION: Places a magenta disk with center (252, 22) and radius 46.
; PLAN: r0=252(x), r1=22(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 22
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
