; DESCRIPTION: Composite: Places a black line segment connecting (96, 152) to (164, 220) then Draws a yellow rectangle at (259, 195) with width 70 and height 26 then Sets a single yellow pixel at (154, 129).
; PLAN: r0=96(x1), r1=152(y1), r2=164(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=195(y), r7=70(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x), r11=129(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 152
LDI r2, 164
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 195
LDI r7, 70
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 129
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
