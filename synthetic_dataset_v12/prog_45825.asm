; DESCRIPTION: Composite: Creates a cyan circular shape at (87, 164) with radius 35 then Places a purple line segment connecting (406, 211) to (15, 19) then Draws a magenta rectangle at (75, 25) with width 117 and height 86.
; PLAN: r0=87(x), r1=164(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=211(y1), r7=15(x2), r8=19(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=25(y), r12=117(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 164
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 211
LDI r7, 15
LDI r8, 19
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 25
LDI r12, 117
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
