; DESCRIPTION: Composite: Draws a green line from (505, 121) to (40, 208) then Places a blue 52x57 rectangle at position (20, 13) then Places a yellow dot at position (100, 69).
; PLAN: r0=505(x1), r1=121(y1), r2=40(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=13(y), r7=52(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=69(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 505
LDI r1, 121
LDI r2, 40
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 13
LDI r7, 52
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 69
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
