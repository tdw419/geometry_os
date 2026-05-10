; DESCRIPTION: Composite: Draws a cyan line from (91, 106) to (136, 232) then Places a white dot at position (146, 241) then Renders a purple box of size 53x99 starting at (427, 0).
; PLAN: r0=91(x1), r1=106(y1), r2=136(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=241(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=427(x), r11=0(y), r12=53(width), r13=99(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 106
LDI r2, 136
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 241
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 427
LDI r11, 0
LDI r12, 53
LDI r13, 99
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
