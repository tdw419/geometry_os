; DESCRIPTION: Creates a blue circular shape at (96, 174) with radius 59.
; PLAN: r0=96(x), r1=174(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 174
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
