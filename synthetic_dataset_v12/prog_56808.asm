; DESCRIPTION: Composite: Sets a single purple pixel at (74, 225) then Places a magenta line segment connecting (154, 220) to (451, 249) then Creates a green rectangular region at (46, 54) spanning 106 by 52 pixels.
; PLAN: r0=74(x), r1=225(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=154(x1), r6=220(y1), r7=451(x2), r8=249(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=46(x), r11=54(y), r12=106(width), r13=52(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 225
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 220
LDI r7, 451
LDI r8, 249
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 54
LDI r12, 106
LDI r13, 52
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
