; DESCRIPTION: Composite: Draws a white rectangle at (265, 152) with width 46 and height 90 then Draws a purple line from (403, 60) to (343, 23).
; PLAN: r0=265(x), r1=152(y), r2=46(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=60(y1), r7=343(x2), r8=23(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 152
LDI r2, 46
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 60
LDI r7, 343
LDI r8, 23
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
