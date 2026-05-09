; DESCRIPTION: Places a magenta circle of radius 62 at center (113, 192).
; PLAN: r0=113(x), r1=192(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 192
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
