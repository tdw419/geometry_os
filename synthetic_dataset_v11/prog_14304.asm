; DESCRIPTION: Places a magenta circle of radius 70 at center (108, 172).
; PLAN: r0=108(x), r1=172(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 172
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
