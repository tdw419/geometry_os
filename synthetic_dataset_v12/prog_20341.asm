; DESCRIPTION: Composite: Draws a red line from (241, 148) to (268, 181) then Places a red 37x84 rectangle at position (195, 121).
; PLAN: r0=241(x1), r1=148(y1), r2=268(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=121(y), r7=37(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 148
LDI r2, 268
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 121
LDI r7, 37
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
