; DESCRIPTION: Composite: Renders a white box of size 93x97 starting at (172, 50) then Draws a orange line from (433, 125) to (30, 171) then Draws a white circle centered at (380, 164) with radius 38.
; PLAN: r0=172(x), r1=50(y), r2=93(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=125(y1), r7=30(x2), r8=171(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=164(y), r12=38(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 50
LDI r2, 93
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 125
LDI r7, 30
LDI r8, 171
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 164
LDI r12, 38
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
