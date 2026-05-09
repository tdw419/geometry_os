; DESCRIPTION: Creates a black circular shape at (180, 186) with radius 59.
; PLAN: r0=180(x), r1=186(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 186
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
