; DESCRIPTION: Composite: Draws a white rectangle at (230, 98) with width 66 and height 26 then Places a blue dot at position (132, 4) then Renders a yellow line between points (146, 98) and (250, 41).
; PLAN: r0=230(x), r1=98(y), r2=66(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=4(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=146(x1), r11=98(y1), r12=250(x2), r13=41(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 98
LDI r2, 66
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 4
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 98
LDI r12, 250
LDI r13, 41
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
