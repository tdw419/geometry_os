; DESCRIPTION: Places a magenta disk with center (297, 1) and radius 68.
; PLAN: r0=297(x), r1=1(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 1
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
