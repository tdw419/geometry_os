; DESCRIPTION: Places a magenta circle of radius 60 at center (126, 107).
; PLAN: r0=126(x), r1=107(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 107
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
