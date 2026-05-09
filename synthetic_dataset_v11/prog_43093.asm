; DESCRIPTION: Creates a blue circular shape at (187, 111) with radius 63.
; PLAN: r0=187(x), r1=111(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 111
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
