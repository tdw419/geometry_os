; DESCRIPTION: Places a magenta circle of radius 41 at center (210, 190).
; PLAN: r0=210(x), r1=190(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 190
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
