; DESCRIPTION: Composite: Sets a single cyan pixel at (205, 133) then Creates a blue circular shape at (185, 152) with radius 67 then Renders a orange line between points (110, 199) and (290, 138).
; PLAN: r0=205(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=152(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=110(x1), r11=199(y1), r12=290(x2), r13=138(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 152
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 110
LDI r11, 199
LDI r12, 290
LDI r13, 138
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
