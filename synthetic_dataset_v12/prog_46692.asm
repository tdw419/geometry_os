; DESCRIPTION: Composite: Renders a magenta disk with center (330, 95) and radius 78 then Creates a purple rectangular region at (318, 118) spanning 49 by 70 pixels.
; PLAN: r0=330(x), r1=95(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=118(y), r7=49(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 95
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 118
LDI r7, 49
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
