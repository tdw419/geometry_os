; DESCRIPTION: Composite: . Then Renders a white line between points (224, 219) and (255, 105). Then Draws a blue circle centered at (177, 191) with radius 36.
; PLAN: r0=224(x1), r1=219(y1), r2=255(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=177(x), r1=191(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (224, 219) and (255, 105).
; PLAN: r0=224(x1), r1=219(y1), r2=255(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 219
LDI r2, 255
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (177, 191) with radius 36.
; PLAN: r0=177(x), r1=191(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 191
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
