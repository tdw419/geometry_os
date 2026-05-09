; DESCRIPTION: Creates a magenta circular shape at (120, 186) with radius 14.
; PLAN: r0=120(x), r1=186(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 186
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
