; DESCRIPTION: Composite: Draws a red circle centered at (207, 78) with radius 73 then Draws a cyan line from (332, 14) to (470, 184) then Places a yellow 22x22 rectangle at position (137, 229).
; PLAN: r0=207(x), r1=78(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=14(y1), r7=470(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=229(y), r12=22(width), r13=22(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 78
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 14
LDI r7, 470
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 229
LDI r12, 22
LDI r13, 22
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
