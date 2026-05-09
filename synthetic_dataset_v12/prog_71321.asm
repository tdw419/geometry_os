; DESCRIPTION: Places a magenta circle of radius 41 at center (113, 57).
; PLAN: r0=113(x), r1=57(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 57
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
