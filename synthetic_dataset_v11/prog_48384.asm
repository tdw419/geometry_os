; DESCRIPTION: Places a magenta circle of radius 58 at center (173, 127).
; PLAN: r0=173(x), r1=127(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 127
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
