; DESCRIPTION: Composite: Draws a white rectangle at (185, 112) with width 61 and height 30 then Renders a green line between points (351, 156) and (321, 165).
; PLAN: r0=185(x), r1=112(y), r2=61(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x1), r6=156(y1), r7=321(x2), r8=165(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 112
LDI r2, 61
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 156
LDI r7, 321
LDI r8, 165
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
