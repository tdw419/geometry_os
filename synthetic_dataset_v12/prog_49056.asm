; DESCRIPTION: Composite: Sets a single yellow pixel at (347, 236) then Draws a orange rectangle at (280, 45) with width 31 and height 104 then Renders a magenta line between points (479, 89) and (86, 255).
; PLAN: r0=347(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=45(y), r7=31(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x1), r11=89(y1), r12=86(x2), r13=255(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 280
LDI r6, 45
LDI r7, 31
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 89
LDI r12, 86
LDI r13, 255
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
