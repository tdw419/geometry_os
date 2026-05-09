; DESCRIPTION: Creates a blue circular shape at (143, 186) with radius 55.
; PLAN: r0=143(x), r1=186(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 186
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
