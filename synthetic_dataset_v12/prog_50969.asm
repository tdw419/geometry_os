; DESCRIPTION: Places a magenta circle of radius 46 at center (385, 169).
; PLAN: r0=385(x), r1=169(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 169
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
