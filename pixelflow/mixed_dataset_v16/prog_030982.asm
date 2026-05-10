; DESCRIPTION: Places a magenta disk with center (34, 111) and radius 54.
; PLAN: r0=34(x), r1=111(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 111
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
