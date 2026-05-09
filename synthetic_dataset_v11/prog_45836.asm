; DESCRIPTION: Creates a blue circular shape at (182, 186) with radius 23.
; PLAN: r0=182(x), r1=186(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 186
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
