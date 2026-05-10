; DESCRIPTION: Composite: Places a blue line segment connecting (343, 237) to (83, 232) then Creates a purple rectangular region at (27, 120) spanning 48 by 20 pixels.
; PLAN: r0=343(x1), r1=237(y1), r2=83(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=120(y), r7=48(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 237
LDI r2, 83
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 120
LDI r7, 48
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
