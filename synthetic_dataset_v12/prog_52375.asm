; DESCRIPTION: Composite: Renders a yellow disk with center (209, 181) and radius 38 then Creates a green rectangular region at (140, 200) spanning 47 by 20 pixels.
; PLAN: r0=209(x), r1=181(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=200(y), r7=47(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 181
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 200
LDI r7, 47
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
