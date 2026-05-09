; DESCRIPTION: Composite: Draws a orange rectangle at (58, 159) with width 113 and height 18 then Renders a white line between points (139, 140) and (81, 63).
; PLAN: r0=58(x), r1=159(y), r2=113(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x1), r6=140(y1), r7=81(x2), r8=63(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 159
LDI r2, 113
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 140
LDI r7, 81
LDI r8, 63
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
