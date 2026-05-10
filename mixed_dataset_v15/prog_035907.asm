; DESCRIPTION: Composite: Draws a white rectangle at (299, 185) with width 52 and height 26 then Renders a white line between points (195, 41) and (413, 247).
; PLAN: r0=299(x), r1=185(y), r2=52(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x1), r6=41(y1), r7=413(x2), r8=247(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 185
LDI r2, 52
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 41
LDI r7, 413
LDI r8, 247
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
