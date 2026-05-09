; DESCRIPTION: Composite: . Then Creates a purple circular shape at (224, 160) with radius 12. Then Creates a blue rectangular region at (19, 36) spanning 15 by 72 pixels.
; PLAN: r0=224(x), r1=160(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=19(x), r1=36(y), r2=15(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (224, 160) with radius 12.
; PLAN: r0=224(x), r1=160(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 160
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (19, 36) spanning 15 by 72 pixels.
; PLAN: r0=19(x), r1=36(y), r2=15(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 36
LDI r2, 15
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
