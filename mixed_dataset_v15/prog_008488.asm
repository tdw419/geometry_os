; DESCRIPTION: Composite: Draws a purple rectangle at (225, 62) with width 115 and height 23 then Draws a green line from (295, 65) to (121, 180) then Creates a orange circular shape at (298, 144) with radius 64.
; PLAN: r0=225(x), r1=62(y), r2=115(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x1), r6=65(y1), r7=121(x2), r8=180(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=298(x), r11=144(y), r12=64(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 62
LDI r2, 115
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 65
LDI r7, 121
LDI r8, 180
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 144
LDI r12, 64
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
