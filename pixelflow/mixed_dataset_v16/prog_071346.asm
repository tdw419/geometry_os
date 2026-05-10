; DESCRIPTION: Places a blue circle of radius 41 at center (190, 68).
; PLAN: r0=190(x), r1=68(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 68
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
