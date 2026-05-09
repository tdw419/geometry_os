; DESCRIPTION: Composite: Renders a white line between points (443, 193) and (190, 151) then Draws a white rectangle at (334, 105) with width 106 and height 11.
; PLAN: r0=443(x1), r1=193(y1), r2=190(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=105(y), r7=106(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 193
LDI r2, 190
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 105
LDI r7, 106
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
