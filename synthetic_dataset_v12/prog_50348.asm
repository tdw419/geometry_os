; DESCRIPTION: Places a magenta circle of radius 68 at center (301, 162).
; PLAN: r0=301(x), r1=162(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 162
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
