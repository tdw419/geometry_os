; DESCRIPTION: Composite: Renders a cyan line between points (272, 175) and (432, 162) then Draws a purple rectangle at (153, 135) with width 58 and height 63 then Places a white dot at position (282, 196).
; PLAN: r0=272(x1), r1=175(y1), r2=432(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=135(y), r7=58(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x), r11=196(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 175
LDI r2, 432
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 135
LDI r7, 58
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 196
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
