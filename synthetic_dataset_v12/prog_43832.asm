; DESCRIPTION: Creates a blue circular shape at (392, 86) with radius 22.
; PLAN: r0=392(x), r1=86(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 86
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
