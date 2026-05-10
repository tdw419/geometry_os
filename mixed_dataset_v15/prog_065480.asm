; DESCRIPTION: Composite: Sets a single white pixel at (6, 248) then Places a white 38x106 rectangle at position (115, 17) then Places a magenta line segment connecting (132, 138) to (94, 93).
; PLAN: r0=6(x), r1=248(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=17(y), r7=38(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x1), r11=138(y1), r12=94(x2), r13=93(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 248
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 115
LDI r6, 17
LDI r7, 38
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 138
LDI r12, 94
LDI r13, 93
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
