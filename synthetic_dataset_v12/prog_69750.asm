; DESCRIPTION: Composite: Renders a black line between points (329, 181) and (40, 192) then Draws a black rectangle at (179, 68) with width 115 and height 19 then Places a cyan dot at position (441, 250).
; PLAN: r0=329(x1), r1=181(y1), r2=40(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=68(y), r7=115(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=250(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 181
LDI r2, 40
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 68
LDI r7, 115
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 250
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
