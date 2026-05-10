; DESCRIPTION: Composite: Draws a green line from (416, 39) to (323, 208) then Creates a green rectangular region at (11, 15) spanning 11 by 16 pixels.
; PLAN: r0=416(x1), r1=39(y1), r2=323(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=15(y), r7=11(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 39
LDI r2, 323
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 15
LDI r7, 11
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
