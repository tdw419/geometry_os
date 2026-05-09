; DESCRIPTION: Composite: Renders a blue line between points (272, 49) and (411, 144) then Draws a green rectangle at (167, 27) with width 24 and height 65 then Sets a single yellow pixel at (394, 141).
; PLAN: r0=272(x1), r1=49(y1), r2=411(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=27(y), r7=24(width), r8=65(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=141(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 49
LDI r2, 411
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 27
LDI r7, 24
LDI r8, 65
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 141
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
