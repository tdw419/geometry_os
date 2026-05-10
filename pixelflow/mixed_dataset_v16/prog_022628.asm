; DESCRIPTION: Composite: Draws a white rectangle at (370, 56) with width 91 and height 87 then Renders a yellow line between points (324, 9) and (37, 184).
; PLAN: r0=370(x), r1=56(y), r2=91(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x1), r6=9(y1), r7=37(x2), r8=184(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 56
LDI r2, 91
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 9
LDI r7, 37
LDI r8, 184
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
