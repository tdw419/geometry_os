; DESCRIPTION: Composite: Draws a black rectangle at (290, 48) with width 42 and height 80 then Renders a blue line between points (118, 143) and (278, 246) then Sets a single magenta pixel at (4, 219).
; PLAN: r0=290(x), r1=48(y), r2=42(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=143(y1), r7=278(x2), r8=246(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=4(x), r11=219(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 48
LDI r2, 42
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 143
LDI r7, 278
LDI r8, 246
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 219
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
