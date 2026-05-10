; DESCRIPTION: Composite: Creates a purple rectangular region at (10, 25) spanning 85 by 49 pixels then Renders a purple line between points (444, 175) and (286, 213).
; PLAN: r0=10(x), r1=25(y), r2=85(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x1), r6=175(y1), r7=286(x2), r8=213(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 25
LDI r2, 85
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 175
LDI r7, 286
LDI r8, 213
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
