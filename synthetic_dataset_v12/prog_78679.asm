; DESCRIPTION: Composite: Draws a blue circle centered at (425, 180) with radius 12 then Places a black line segment connecting (292, 198) to (443, 22) then Creates a cyan rectangular region at (231, 38) spanning 60 by 55 pixels.
; PLAN: r0=425(x), r1=180(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x1), r6=198(y1), r7=443(x2), r8=22(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=38(y), r12=60(width), r13=55(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 180
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 198
LDI r7, 443
LDI r8, 22
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 38
LDI r12, 60
LDI r13, 55
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
