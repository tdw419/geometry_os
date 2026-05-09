; DESCRIPTION: Composite: . Then Creates a blue circular shape at (104, 210) with radius 38. Then Creates a green rectangular region at (65, 26) spanning 31 by 20 pixels.
; PLAN: r0=104(x), r1=210(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x), r1=26(y), r2=31(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (104, 210) with radius 38.
; PLAN: r0=104(x), r1=210(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 210
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (65, 26) spanning 31 by 20 pixels.
; PLAN: r0=65(x), r1=26(y), r2=31(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 26
LDI r2, 31
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
