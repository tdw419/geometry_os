; DESCRIPTION: Composite: Renders a orange line between points (276, 198) and (499, 173) then Places a yellow 16x14 rectangle at position (88, 199).
; PLAN: r0=276(x1), r1=198(y1), r2=499(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=199(y), r7=16(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 198
LDI r2, 499
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 199
LDI r7, 16
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
