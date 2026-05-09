; DESCRIPTION: Composite: Renders a white disk with center (252, 119) and radius 41 then Draws a red line from (323, 224) to (165, 27).
; PLAN: r0=252(x), r1=119(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x1), r6=224(y1), r7=165(x2), r8=27(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 119
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 224
LDI r7, 165
LDI r8, 27
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
