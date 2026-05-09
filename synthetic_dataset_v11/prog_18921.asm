; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (204, 92) with radius 43. Then Creates a blue rectangular region at (152, 109) spanning 89 by 75 pixels.
; PLAN: r0=204(x), r1=92(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=152(x), r1=109(y), r2=89(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (204, 92) with radius 43.
; PLAN: r0=204(x), r1=92(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 92
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (152, 109) spanning 89 by 75 pixels.
; PLAN: r0=152(x), r1=109(y), r2=89(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 109
LDI r2, 89
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
