; DESCRIPTION: Composite: Places a black 75x109 rectangle at position (297, 26) then Renders a magenta line between points (138, 123) and (60, 48) then Places a white dot at position (144, 137).
; PLAN: r0=297(x), r1=26(y), r2=75(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x1), r6=123(y1), r7=60(x2), r8=48(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=144(x), r11=137(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 26
LDI r2, 75
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 123
LDI r7, 60
LDI r8, 48
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 137
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
