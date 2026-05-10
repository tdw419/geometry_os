; DESCRIPTION: Composite: Renders a blue line between points (95, 213) and (110, 173) then Sets a single red pixel at (248, 179) then Places a black 85x35 rectangle at position (227, 3).
; PLAN: r0=95(x1), r1=213(y1), r2=110(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=179(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=227(x), r11=3(y), r12=85(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 213
LDI r2, 110
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 179
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 227
LDI r11, 3
LDI r12, 85
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
