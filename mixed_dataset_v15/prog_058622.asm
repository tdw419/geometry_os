; DESCRIPTION: Composite: Draws a white rectangle at (52, 236) with width 10 and height 11 then Draws a white line from (118, 131) to (462, 81) then Places a yellow dot at position (26, 122).
; PLAN: r0=52(x), r1=236(y), r2=10(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=131(y1), r7=462(x2), r8=81(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=122(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 236
LDI r2, 10
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 131
LDI r7, 462
LDI r8, 81
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 122
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
