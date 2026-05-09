; DESCRIPTION: Places a magenta circle of radius 65 at center (182, 123).
; PLAN: r0=182(x), r1=123(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 123
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
