; DESCRIPTION: Places a magenta circle of radius 44 at center (154, 167).
; PLAN: r0=154(x), r1=167(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 167
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
