; DESCRIPTION: Places a magenta circle of radius 58 at center (68, 107).
; PLAN: r0=68(x), r1=107(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 107
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
