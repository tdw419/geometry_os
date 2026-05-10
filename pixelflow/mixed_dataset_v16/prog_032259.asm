; DESCRIPTION: Places a magenta disk with center (290, 2) and radius 14.
; PLAN: r0=290(x), r1=2(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 2
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
