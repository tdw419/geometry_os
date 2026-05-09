; DESCRIPTION: Places a magenta circle of radius 62 at center (352, 162).
; PLAN: r0=352(x), r1=162(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 162
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
