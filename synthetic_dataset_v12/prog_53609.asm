; DESCRIPTION: Composite: Draws a black rectangle at (206, 204) with width 97 and height 28 then Places a magenta line segment connecting (463, 217) to (300, 133) then Places a purple dot at position (309, 130).
; PLAN: r0=206(x), r1=204(y), r2=97(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x1), r6=217(y1), r7=300(x2), r8=133(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=130(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 206
LDI r1, 204
LDI r2, 97
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 217
LDI r7, 300
LDI r8, 133
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 130
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
