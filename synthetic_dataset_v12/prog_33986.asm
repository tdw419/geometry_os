; DESCRIPTION: Composite: Places a blue 97x92 rectangle at position (179, 44) then Places a magenta line segment connecting (426, 197) to (134, 22) then Places a green circle of radius 62 at center (398, 120).
; PLAN: r0=179(x), r1=44(y), r2=97(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x1), r6=197(y1), r7=134(x2), r8=22(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=398(x), r11=120(y), r12=62(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 44
LDI r2, 97
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 197
LDI r7, 134
LDI r8, 22
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 120
LDI r12, 62
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
