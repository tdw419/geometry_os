; DESCRIPTION: Composite: Draws a blue rectangle at (85, 34) with width 42 and height 115 then Draws a yellow line from (7, 33) to (20, 99) then Sets a single blue pixel at (1, 22).
; PLAN: r0=85(x), r1=34(y), r2=42(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=33(y1), r7=20(x2), r8=99(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=1(x), r11=22(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 34
LDI r2, 42
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 33
LDI r7, 20
LDI r8, 99
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 1
LDI r11, 22
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
