; DESCRIPTION: Creates a blue circular shape at (65, 187) with radius 59.
; PLAN: r0=65(x), r1=187(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 187
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
