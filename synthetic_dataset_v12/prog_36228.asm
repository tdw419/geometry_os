; DESCRIPTION: Composite: Places a blue dot at position (180, 185) then Creates a green rectangular region at (318, 106) spanning 53 by 84 pixels.
; PLAN: r0=180(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=106(y), r7=53(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 185
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 106
LDI r7, 53
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
