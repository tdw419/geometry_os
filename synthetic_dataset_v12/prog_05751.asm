; DESCRIPTION: Composite: Places a red line segment connecting (426, 116) to (301, 166) then Creates a magenta rectangular region at (32, 127) spanning 97 by 67 pixels.
; PLAN: r0=426(x1), r1=116(y1), r2=301(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=127(y), r7=97(width), r8=67(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 116
LDI r2, 301
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 127
LDI r7, 97
LDI r8, 67
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
