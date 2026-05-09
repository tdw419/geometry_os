; DESCRIPTION: Places a magenta circle of radius 76 at center (154, 106).
; PLAN: r0=154(x), r1=106(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 106
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
