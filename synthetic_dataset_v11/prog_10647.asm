; DESCRIPTION: Places a magenta circle of radius 68 at center (144, 127).
; PLAN: r0=144(x), r1=127(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 127
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
