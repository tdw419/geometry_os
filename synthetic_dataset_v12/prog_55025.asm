; DESCRIPTION: Places a magenta circle of radius 50 at center (366, 132).
; PLAN: r0=366(x), r1=132(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 132
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
