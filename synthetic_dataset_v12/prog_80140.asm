; DESCRIPTION: Creates a magenta circular shape at (392, 216) with radius 22.
; PLAN: r0=392(x), r1=216(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 216
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
