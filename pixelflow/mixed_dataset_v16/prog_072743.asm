; DESCRIPTION: Composite: Draws a black line from (113, 97) to (290, 12) then Draws a yellow rectangle at (209, 139) with width 44 and height 109 then Places a white dot at position (315, 255).
; PLAN: r0=113(x1), r1=97(y1), r2=290(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=139(y), r7=44(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=255(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 97
LDI r2, 290
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 139
LDI r7, 44
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 255
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
