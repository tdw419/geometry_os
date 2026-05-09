; DESCRIPTION: Composite: Draws a orange rectangle at (154, 115) with width 98 and height 91 then Draws a blue line from (298, 41) to (54, 9) then Renders a orange disk with center (233, 171) and radius 62.
; PLAN: r0=154(x), r1=115(y), r2=98(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x1), r6=41(y1), r7=54(x2), r8=9(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=171(y), r12=62(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 115
LDI r2, 98
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 41
LDI r7, 54
LDI r8, 9
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 171
LDI r12, 62
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
