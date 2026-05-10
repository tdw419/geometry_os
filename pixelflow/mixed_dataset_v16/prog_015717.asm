; DESCRIPTION: Composite: Draws a green rectangle at (369, 171) with width 80 and height 46 then Places a white dot at position (295, 161) then Renders a orange line between points (458, 70) and (19, 1).
; PLAN: r0=369(x), r1=171(y), r2=80(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=458(x1), r11=70(y1), r12=19(x2), r13=1(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 171
LDI r2, 80
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 458
LDI r11, 70
LDI r12, 19
LDI r13, 1
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
