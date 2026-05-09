; DESCRIPTION: Places a magenta circle of radius 65 at center (188, 139).
; PLAN: r0=188(x), r1=139(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 139
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
