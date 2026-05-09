; DESCRIPTION: Composite: Creates a green rectangular region at (205, 27) spanning 87 by 57 pixels then Draws a purple line from (327, 189) to (93, 35) then Places a yellow dot at position (30, 154).
; PLAN: r0=205(x), r1=27(y), r2=87(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x1), r6=189(y1), r7=93(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=154(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 27
LDI r2, 87
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 189
LDI r7, 93
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 154
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
