; DESCRIPTION: Composite: Draws a orange rectangle at (367, 135) with width 113 and height 77 then Draws a green line from (471, 144) to (428, 227) then Places a white circle of radius 20 at center (271, 66).
; PLAN: r0=367(x), r1=135(y), r2=113(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=144(y1), r7=428(x2), r8=227(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=66(y), r12=20(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 135
LDI r2, 113
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 144
LDI r7, 428
LDI r8, 227
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 66
LDI r12, 20
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
