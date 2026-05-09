; DESCRIPTION: Composite: Renders a green disk with center (359, 87) and radius 25 then Creates a purple rectangular region at (400, 112) spanning 89 by 103 pixels.
; PLAN: r0=359(x), r1=87(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=112(y), r7=89(width), r8=103(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 87
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 112
LDI r7, 89
LDI r8, 103
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
