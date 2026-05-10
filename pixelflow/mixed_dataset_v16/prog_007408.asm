; DESCRIPTION: Composite: Draws a blue rectangle at (40, 91) with width 46 and height 98 then Places a magenta line segment connecting (324, 83) to (24, 43).
; PLAN: r0=40(x), r1=91(y), r2=46(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x1), r6=83(y1), r7=24(x2), r8=43(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 91
LDI r2, 46
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 83
LDI r7, 24
LDI r8, 43
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
