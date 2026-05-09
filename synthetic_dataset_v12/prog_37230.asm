; DESCRIPTION: Places a magenta circle of radius 65 at center (127, 144).
; PLAN: r0=127(x), r1=144(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 144
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
