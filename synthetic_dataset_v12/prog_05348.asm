; DESCRIPTION: Composite: Creates a green rectangular region at (65, 136) spanning 81 by 47 pixels then Draws a green circle centered at (100, 179) with radius 49 then Places a blue dot at position (422, 21).
; PLAN: r0=65(x), r1=136(y), r2=81(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=179(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=422(x), r11=21(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 136
LDI r2, 81
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 179
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 422
LDI r11, 21
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
