; DESCRIPTION: Places a magenta disk with center (303, 45) and radius 47.
; PLAN: r0=303(x), r1=45(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 45
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
