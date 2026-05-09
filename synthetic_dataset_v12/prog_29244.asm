; DESCRIPTION: Composite: Places a yellow dot at position (353, 204) then Draws a blue rectangle at (96, 35) with width 70 and height 97 then Draws a green line from (443, 185) to (134, 24).
; PLAN: r0=353(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=35(y), r7=70(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x1), r11=185(y1), r12=134(x2), r13=24(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 204
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 96
LDI r6, 35
LDI r7, 70
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 185
LDI r12, 134
LDI r13, 24
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
