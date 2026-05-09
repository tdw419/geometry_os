; DESCRIPTION: Places a magenta circle of radius 58 at center (182, 168).
; PLAN: r0=182(x), r1=168(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 168
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
