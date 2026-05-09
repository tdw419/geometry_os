; DESCRIPTION: Composite: Draws a black line from (408, 29) to (204, 180) then Renders a white box of size 114x45 starting at (306, 26) then Sets a single purple pixel at (212, 195).
; PLAN: r0=408(x1), r1=29(y1), r2=204(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=26(y), r7=114(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x), r11=195(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 29
LDI r2, 204
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 26
LDI r7, 114
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 195
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
