; DESCRIPTION: Composite: Draws a green rectangle at (391, 85) with width 31 and height 26 then Places a white line segment connecting (86, 152) to (481, 6) then Places a purple dot at position (403, 1).
; PLAN: r0=391(x), r1=85(y), r2=31(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x1), r6=152(y1), r7=481(x2), r8=6(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=403(x), r11=1(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 85
LDI r2, 31
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 152
LDI r7, 481
LDI r8, 6
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 1
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
