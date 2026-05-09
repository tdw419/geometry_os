; DESCRIPTION: Composite: Places a blue dot at position (205, 1) then Renders a green line between points (30, 106) and (381, 243) then Creates a white rectangular region at (37, 180) spanning 83 by 37 pixels.
; PLAN: r0=205(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=106(y1), r7=381(x2), r8=243(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=180(y), r12=83(width), r13=37(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 106
LDI r7, 381
LDI r8, 243
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 180
LDI r12, 83
LDI r13, 37
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
