; DESCRIPTION: Places a magenta circle of radius 48 at center (180, 162).
; PLAN: r0=180(x), r1=162(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 162
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
