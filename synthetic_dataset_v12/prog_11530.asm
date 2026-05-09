; DESCRIPTION: Composite: Places a green 114x44 rectangle at position (186, 160) then Renders a magenta line between points (237, 192) and (411, 176) then Places a white dot at position (196, 79).
; PLAN: r0=186(x), r1=160(y), r2=114(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x1), r6=192(y1), r7=411(x2), r8=176(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=79(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 160
LDI r2, 114
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 192
LDI r7, 411
LDI r8, 176
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 79
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
