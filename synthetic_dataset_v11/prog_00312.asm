; DESCRIPTION: Places a magenta circle of radius 26 at center (174, 161).
; PLAN: r0=174(x), r1=161(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 161
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
