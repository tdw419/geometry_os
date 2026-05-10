; DESCRIPTION: Composite: Sets a single cyan pixel at (489, 195) then Draws a purple rectangle at (31, 31) with width 69 and height 54 then Places a magenta line segment connecting (210, 222) to (287, 154).
; PLAN: r0=489(x), r1=195(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=31(y), r7=69(width), r8=54(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x1), r11=222(y1), r12=287(x2), r13=154(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 195
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 31
LDI r6, 31
LDI r7, 69
LDI r8, 54
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 222
LDI r12, 287
LDI r13, 154
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
