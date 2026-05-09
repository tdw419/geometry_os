; DESCRIPTION: Composite: . Then Creates a purple circular shape at (110, 237) with radius 19. Then Renders a white box of size 37x120 starting at (148, 124).
; PLAN: r0=110(x), r1=237(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=148(x), r1=124(y), r2=37(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (110, 237) with radius 19.
; PLAN: r0=110(x), r1=237(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 237
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white box of size 37x120 starting at (148, 124).
; PLAN: r0=148(x), r1=124(y), r2=37(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 124
LDI r2, 37
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
