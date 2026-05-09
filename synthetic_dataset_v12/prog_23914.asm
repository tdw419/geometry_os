; DESCRIPTION: Composite: Places a blue line segment connecting (193, 6) to (315, 110) then Places a white 51x100 rectangle at position (187, 54) then Draws a white circle centered at (99, 109) with radius 80.
; PLAN: r0=193(x1), r1=6(y1), r2=315(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=54(y), r7=51(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=109(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 6
LDI r2, 315
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 54
LDI r7, 51
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 109
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
