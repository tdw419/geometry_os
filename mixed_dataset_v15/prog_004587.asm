; DESCRIPTION: Composite: Draws a black line from (97, 142) to (466, 108) then Draws a green rectangle at (274, 47) with width 41 and height 92 then Places a red dot at position (330, 211).
; PLAN: r0=97(x1), r1=142(y1), r2=466(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=47(y), r7=41(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x), r11=211(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 142
LDI r2, 466
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 47
LDI r7, 41
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 211
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
