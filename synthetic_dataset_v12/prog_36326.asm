; DESCRIPTION: Creates a magenta circular shape at (442, 127) with radius 70.
; PLAN: r0=442(x), r1=127(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 127
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
