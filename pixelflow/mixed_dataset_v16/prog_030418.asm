; DESCRIPTION: Composite: Places a orange dot at position (186, 165) then Places a yellow 40x22 rectangle at position (23, 30) then Draws a cyan line from (186, 38) to (484, 189).
; PLAN: r0=186(x), r1=165(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=30(y), r7=40(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=186(x1), r11=38(y1), r12=484(x2), r13=189(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 165
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 23
LDI r6, 30
LDI r7, 40
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 38
LDI r12, 484
LDI r13, 189
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
