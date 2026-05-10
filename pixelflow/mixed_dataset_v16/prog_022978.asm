; DESCRIPTION: Composite: Places a blue dot at position (187, 251) then Places a red line segment connecting (150, 211) to (238, 83) then Creates a green rectangular region at (357, 159) spanning 63 by 65 pixels.
; PLAN: r0=187(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=150(x1), r6=211(y1), r7=238(x2), r8=83(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=159(y), r12=63(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 150
LDI r6, 211
LDI r7, 238
LDI r8, 83
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 159
LDI r12, 63
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
