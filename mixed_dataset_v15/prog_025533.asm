; DESCRIPTION: Composite: Renders a cyan line between points (470, 43) and (475, 176) then Draws a green rectangle at (204, 215) with width 13 and height 35 then Sets a single yellow pixel at (100, 18).
; PLAN: r0=470(x1), r1=43(y1), r2=475(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=215(y), r7=13(width), r8=35(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=18(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 470
LDI r1, 43
LDI r2, 475
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 215
LDI r7, 13
LDI r8, 35
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 18
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
