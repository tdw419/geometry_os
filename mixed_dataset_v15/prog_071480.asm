; DESCRIPTION: Composite: Renders a red line between points (41, 76) and (242, 84) then Draws a green rectangle at (415, 29) with width 73 and height 87 then Places a purple dot at position (375, 91).
; PLAN: r0=41(x1), r1=76(y1), r2=242(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=29(y), r7=73(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=91(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 41
LDI r1, 76
LDI r2, 242
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 29
LDI r7, 73
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 91
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
