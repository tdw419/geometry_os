; DESCRIPTION: Composite: Sets a single blue pixel at (186, 137) then Places a cyan 107x48 rectangle at position (272, 188) then Renders a orange line between points (427, 161) and (330, 135).
; PLAN: r0=186(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=188(y), r7=107(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x1), r11=161(y1), r12=330(x2), r13=135(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 188
LDI r7, 107
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 161
LDI r12, 330
LDI r13, 135
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
