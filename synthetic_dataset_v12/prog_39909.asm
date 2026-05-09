; DESCRIPTION: Composite: Draws a green circle centered at (80, 40) with radius 32 then Draws a cyan rectangle at (1, 47) with width 98 and height 84 then Places a magenta line segment connecting (162, 79) to (193, 35).
; PLAN: r0=80(x), r1=40(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=47(y), r7=98(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=79(y1), r12=193(x2), r13=35(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 40
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 47
LDI r7, 98
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 79
LDI r12, 193
LDI r13, 35
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
