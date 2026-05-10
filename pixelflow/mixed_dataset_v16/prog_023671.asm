; DESCRIPTION: Composite: Draws a white line from (22, 98) to (467, 145) then Creates a purple rectangular region at (202, 190) spanning 88 by 39 pixels.
; PLAN: r0=22(x1), r1=98(y1), r2=467(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=190(y), r7=88(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 98
LDI r2, 467
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 190
LDI r7, 88
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
