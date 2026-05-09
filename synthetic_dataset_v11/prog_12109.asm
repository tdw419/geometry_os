; DESCRIPTION: Places a magenta circle of radius 68 at center (133, 169).
; PLAN: r0=133(x), r1=169(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 169
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
