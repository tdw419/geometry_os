; DESCRIPTION: Places a magenta circle of radius 70 at center (143, 138).
; PLAN: r0=143(x), r1=138(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 138
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
