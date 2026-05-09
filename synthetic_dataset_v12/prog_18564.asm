; DESCRIPTION: Composite: Draws a purple circle centered at (400, 55) with radius 16 then Renders a yellow line between points (489, 60) and (64, 247).
; PLAN: r0=400(x), r1=55(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x1), r6=60(y1), r7=64(x2), r8=247(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 55
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 60
LDI r7, 64
LDI r8, 247
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
