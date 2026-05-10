; DESCRIPTION: Composite: Renders a red line between points (385, 51) and (439, 98) then Renders a orange box of size 114x102 starting at (159, 51).
; PLAN: r0=385(x1), r1=51(y1), r2=439(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=51(y), r7=114(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 51
LDI r2, 439
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 51
LDI r7, 114
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
