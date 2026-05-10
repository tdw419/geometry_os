; DESCRIPTION: Composite: Places a orange line segment connecting (436, 85) to (19, 209) then Draws a yellow rectangle at (198, 152) with width 25 and height 75.
; PLAN: r0=436(x1), r1=85(y1), r2=19(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=152(y), r7=25(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 85
LDI r2, 19
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 152
LDI r7, 25
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
