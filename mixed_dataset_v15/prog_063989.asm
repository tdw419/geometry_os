; DESCRIPTION: Composite: Draws a magenta rectangle at (231, 171) with width 65 and height 50 then Places a white line segment connecting (117, 4) to (364, 225) then Renders a cyan disk with center (411, 89) and radius 44.
; PLAN: r0=231(x), r1=171(y), r2=65(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=4(y1), r7=364(x2), r8=225(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=89(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 171
LDI r2, 65
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 4
LDI r7, 364
LDI r8, 225
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 89
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
