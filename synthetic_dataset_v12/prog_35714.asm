; DESCRIPTION: Places a blue circle of radius 41 at center (307, 138).
; PLAN: r0=307(x), r1=138(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 138
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
