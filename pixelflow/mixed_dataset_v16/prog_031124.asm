; DESCRIPTION: Creates a blue circular shape at (48, 209) with radius 42.
; PLAN: r0=48(x), r1=209(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 209
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
