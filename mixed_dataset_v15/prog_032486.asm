; DESCRIPTION: Composite: Places a blue line segment connecting (362, 188) to (172, 37) then Draws a white rectangle at (367, 113) with width 45 and height 70 then Places a purple dot at position (272, 9).
; PLAN: r0=362(x1), r1=188(y1), r2=172(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=113(y), r7=45(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=9(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 188
LDI r2, 172
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 113
LDI r7, 45
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 9
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
