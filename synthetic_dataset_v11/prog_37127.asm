; DESCRIPTION: Composite: . Then Draws a green circle centered at (186, 168) with radius 33. Then Creates a blue rectangular region at (93, 104) spanning 17 by 52 pixels.
; PLAN: r0=186(x), r1=168(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=93(x), r1=104(y), r2=17(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (186, 168) with radius 33.
; PLAN: r0=186(x), r1=168(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 168
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (93, 104) spanning 17 by 52 pixels.
; PLAN: r0=93(x), r1=104(y), r2=17(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 104
LDI r2, 17
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
