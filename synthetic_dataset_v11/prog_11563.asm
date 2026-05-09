; DESCRIPTION: Places a magenta circle of radius 41 at center (198, 67).
; PLAN: r0=198(x), r1=67(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 67
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
