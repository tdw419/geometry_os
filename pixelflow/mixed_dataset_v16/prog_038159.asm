; DESCRIPTION: Composite: Draws a green line from (55, 61) to (100, 209) then Draws a purple rectangle at (304, 0) with width 13 and height 100 then Places a blue dot at position (482, 118).
; PLAN: r0=55(x1), r1=61(y1), r2=100(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=0(y), r7=13(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x), r11=118(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 61
LDI r2, 100
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 0
LDI r7, 13
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 118
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
