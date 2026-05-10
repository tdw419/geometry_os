; DESCRIPTION: Places a magenta disk with center (102, 59) and radius 36.
; PLAN: r0=102(x), r1=59(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 59
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
