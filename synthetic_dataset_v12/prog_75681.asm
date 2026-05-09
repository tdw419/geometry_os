; DESCRIPTION: Composite: Places a black 42x20 rectangle at position (179, 186) then Renders a red line between points (84, 139) and (168, 112) then Places a black circle of radius 15 at center (185, 229).
; PLAN: r0=179(x), r1=186(y), r2=42(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x1), r6=139(y1), r7=168(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=185(x), r11=229(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 186
LDI r2, 42
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 139
LDI r7, 168
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 229
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
