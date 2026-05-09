; DESCRIPTION: Composite: Creates a white rectangular region at (256, 166) spanning 60 by 77 pixels then Draws a purple line from (324, 66) to (304, 15).
; PLAN: r0=256(x), r1=166(y), r2=60(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x1), r6=66(y1), r7=304(x2), r8=15(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 166
LDI r2, 60
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 66
LDI r7, 304
LDI r8, 15
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
