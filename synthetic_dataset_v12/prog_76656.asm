; DESCRIPTION: Composite: Draws a orange line from (137, 160) to (296, 0) then Renders a green box of size 106x67 starting at (152, 149) then Places a cyan circle of radius 25 at center (425, 78).
; PLAN: r0=137(x1), r1=160(y1), r2=296(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=149(y), r7=106(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=78(y), r12=25(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 137
LDI r1, 160
LDI r2, 296
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 149
LDI r7, 106
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 78
LDI r12, 25
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
