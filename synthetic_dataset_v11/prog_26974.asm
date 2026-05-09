; DESCRIPTION: Places a magenta circle of radius 50 at center (172, 136).
; PLAN: r0=172(x), r1=136(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 136
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
