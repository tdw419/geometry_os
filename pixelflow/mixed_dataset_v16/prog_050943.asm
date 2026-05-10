; DESCRIPTION: Composite: Places a white dot at position (162, 217) then Places a blue 10x40 rectangle at position (20, 87) then Renders a white line between points (121, 6) and (486, 147).
; PLAN: r0=162(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=87(y), r7=10(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=121(x1), r11=6(y1), r12=486(x2), r13=147(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 217
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 20
LDI r6, 87
LDI r7, 10
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 6
LDI r12, 486
LDI r13, 147
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
