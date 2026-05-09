; DESCRIPTION: Composite: Places a cyan line segment connecting (311, 83) to (152, 209) then Draws a orange circle centered at (202, 95) with radius 58 then Places a magenta dot at position (136, 244).
; PLAN: r0=311(x1), r1=83(y1), r2=152(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=95(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x), r11=244(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 83
LDI r2, 152
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 95
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 244
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
