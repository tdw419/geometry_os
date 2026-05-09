; DESCRIPTION: Composite: Renders a yellow box of size 106x55 starting at (166, 79) then Sets a single cyan pixel at (184, 48) then Places a magenta line segment connecting (332, 210) to (351, 135).
; PLAN: r0=166(x), r1=79(y), r2=106(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=48(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=332(x1), r11=210(y1), r12=351(x2), r13=135(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 79
LDI r2, 106
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 48
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 332
LDI r11, 210
LDI r12, 351
LDI r13, 135
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
