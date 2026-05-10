; DESCRIPTION: Composite: Places a red line segment connecting (466, 253) to (300, 59) then Creates a purple rectangular region at (33, 64) spanning 23 by 110 pixels.
; PLAN: r0=466(x1), r1=253(y1), r2=300(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=64(y), r7=23(width), r8=110(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 253
LDI r2, 300
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 64
LDI r7, 23
LDI r8, 110
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
