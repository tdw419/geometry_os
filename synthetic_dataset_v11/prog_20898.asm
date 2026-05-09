; DESCRIPTION: Places a magenta circle of radius 25 at center (126, 168).
; PLAN: r0=126(x), r1=168(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 168
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
