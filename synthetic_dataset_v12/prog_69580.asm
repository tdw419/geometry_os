; DESCRIPTION: Composite: Places a orange 101x17 rectangle at position (359, 172) then Renders a yellow line between points (215, 167) and (351, 24).
; PLAN: r0=359(x), r1=172(y), r2=101(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x1), r6=167(y1), r7=351(x2), r8=24(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 172
LDI r2, 101
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 167
LDI r7, 351
LDI r8, 24
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
