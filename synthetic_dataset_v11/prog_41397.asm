; DESCRIPTION: Places a magenta circle of radius 62 at center (149, 182).
; PLAN: r0=149(x), r1=182(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 182
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
