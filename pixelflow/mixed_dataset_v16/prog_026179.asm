; DESCRIPTION: Composite: Places a yellow line segment connecting (368, 41) to (140, 178) then Draws a orange rectangle at (244, 40) with width 39 and height 32.
; PLAN: r0=368(x1), r1=41(y1), r2=140(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=40(y), r7=39(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 41
LDI r2, 140
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 40
LDI r7, 39
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
