; DESCRIPTION: Places a magenta circle of radius 70 at center (186, 142).
; PLAN: r0=186(x), r1=142(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 142
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
