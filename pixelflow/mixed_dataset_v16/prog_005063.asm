; DESCRIPTION: Composite: Renders a magenta disk with center (427, 87) and radius 77 then Creates a white rectangular region at (145, 22) spanning 80 by 66 pixels.
; PLAN: r0=427(x), r1=87(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=22(y), r7=80(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 87
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 22
LDI r7, 80
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
