; DESCRIPTION: Composite: Places a blue dot at position (340, 158) then Renders a black box of size 100x12 starting at (117, 70) then Draws a red line from (110, 25) to (132, 52).
; PLAN: r0=340(x), r1=158(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=70(y), r7=100(width), r8=12(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x1), r11=25(y1), r12=132(x2), r13=52(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 158
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 70
LDI r7, 100
LDI r8, 12
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 25
LDI r12, 132
LDI r13, 52
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
