; DESCRIPTION: Places a magenta circle of radius 70 at center (205, 91).
; PLAN: r0=205(x), r1=91(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 91
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
