; DESCRIPTION: Composite: Places a orange 16x70 rectangle at position (105, 139) then Places a orange line segment connecting (416, 110) to (2, 114) then Sets a single green pixel at (152, 163).
; PLAN: r0=105(x), r1=139(y), r2=16(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x1), r6=110(y1), r7=2(x2), r8=114(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=163(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 139
LDI r2, 16
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 110
LDI r7, 2
LDI r8, 114
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 163
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
