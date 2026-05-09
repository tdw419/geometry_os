; DESCRIPTION: Creates a blue circular shape at (79, 107) with radius 59.
; PLAN: r0=79(x), r1=107(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 107
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
