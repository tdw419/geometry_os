; DESCRIPTION: Composite: Draws a red line from (222, 172) to (371, 77) then Creates a blue rectangular region at (247, 74) spanning 99 by 46 pixels.
; PLAN: r0=222(x1), r1=172(y1), r2=371(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=74(y), r7=99(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 172
LDI r2, 371
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 74
LDI r7, 99
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
