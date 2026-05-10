; DESCRIPTION: Composite: Places a green line segment connecting (315, 68) to (82, 70) then Creates a orange rectangular region at (358, 26) spanning 101 by 116 pixels.
; PLAN: r0=315(x1), r1=68(y1), r2=82(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=26(y), r7=101(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 68
LDI r2, 82
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 26
LDI r7, 101
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
