; DESCRIPTION: Composite: Renders a yellow line between points (323, 133) and (160, 134) then Creates a white rectangular region at (47, 41) spanning 109 by 41 pixels.
; PLAN: r0=323(x1), r1=133(y1), r2=160(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=47(x), r6=41(y), r7=109(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 133
LDI r2, 160
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 41
LDI r7, 109
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
