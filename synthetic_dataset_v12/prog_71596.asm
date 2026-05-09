; DESCRIPTION: Composite: Draws a blue rectangle at (146, 146) with width 76 and height 103 then Places a purple line segment connecting (266, 178) to (394, 14) then Places a blue dot at position (98, 162).
; PLAN: r0=146(x), r1=146(y), r2=76(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=178(y1), r7=394(x2), r8=14(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=162(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 146
LDI r2, 76
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 178
LDI r7, 394
LDI r8, 14
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 162
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
