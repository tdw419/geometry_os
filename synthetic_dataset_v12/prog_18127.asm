; DESCRIPTION: Composite: Draws a green rectangle at (281, 72) with width 22 and height 83 then Draws a green line from (464, 159) to (499, 70).
; PLAN: r0=281(x), r1=72(y), r2=22(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x1), r6=159(y1), r7=499(x2), r8=70(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 72
LDI r2, 22
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 159
LDI r7, 499
LDI r8, 70
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
