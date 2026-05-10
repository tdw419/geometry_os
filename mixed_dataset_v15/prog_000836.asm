; DESCRIPTION: Creates a blue circular shape at (424, 82) with radius 68.
; PLAN: r0=424(x), r1=82(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 82
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
