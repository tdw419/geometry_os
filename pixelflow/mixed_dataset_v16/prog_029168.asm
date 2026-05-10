; DESCRIPTION: Composite: Sets a single green pixel at (446, 187) then Draws a red rectangle at (194, 52) with width 102 and height 29 then Draws a black line from (216, 195) to (317, 69).
; PLAN: r0=446(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=52(y), r7=102(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x1), r11=195(y1), r12=317(x2), r13=69(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 52
LDI r7, 102
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 195
LDI r12, 317
LDI r13, 69
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
