; DESCRIPTION: Places a magenta circle of radius 58 at center (437, 161).
; PLAN: r0=437(x), r1=161(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 161
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
