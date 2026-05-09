; DESCRIPTION: Composite: Places a cyan dot at position (411, 254) then Places a magenta 92x75 rectangle at position (192, 97) then Places a orange line segment connecting (408, 20) to (435, 80).
; PLAN: r0=411(x), r1=254(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=97(y), r7=92(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x1), r11=20(y1), r12=435(x2), r13=80(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 254
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 97
LDI r7, 92
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 20
LDI r12, 435
LDI r13, 80
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
