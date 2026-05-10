; DESCRIPTION: Composite: Renders a blue line between points (370, 154) and (291, 208) then Draws a white circle centered at (248, 94) with radius 70 then Places a cyan 89x84 rectangle at position (48, 162).
; PLAN: r0=370(x1), r1=154(y1), r2=291(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=94(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=162(y), r12=89(width), r13=84(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 154
LDI r2, 291
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 94
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 162
LDI r12, 89
LDI r13, 84
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
