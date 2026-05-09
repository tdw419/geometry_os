; DESCRIPTION: Composite: Draws a red rectangle at (338, 39) with width 102 and height 111 then Draws a orange line from (433, 161) to (268, 4) then Draws a white circle centered at (380, 175) with radius 22.
; PLAN: r0=338(x), r1=39(y), r2=102(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=161(y1), r7=268(x2), r8=4(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=175(y), r12=22(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 338
LDI r1, 39
LDI r2, 102
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 161
LDI r7, 268
LDI r8, 4
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 175
LDI r12, 22
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
