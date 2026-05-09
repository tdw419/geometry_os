; DESCRIPTION: Creates a blue circular shape at (346, 180) with radius 20.
; PLAN: r0=346(x), r1=180(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 180
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
