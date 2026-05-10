; DESCRIPTION: Composite: Renders a purple line between points (217, 40) and (416, 40) then Creates a red circular shape at (130, 48) with radius 48.
; PLAN: r0=217(x1), r1=40(y1), r2=416(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=48(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 40
LDI r2, 416
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 48
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
