; DESCRIPTION: Composite: Renders a blue line between points (330, 168) and (248, 113) then Draws a yellow rectangle at (250, 62) with width 55 and height 24 then Places a orange dot at position (297, 195).
; PLAN: r0=330(x1), r1=168(y1), r2=248(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=62(y), r7=55(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=195(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 168
LDI r2, 248
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 62
LDI r7, 55
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 195
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
