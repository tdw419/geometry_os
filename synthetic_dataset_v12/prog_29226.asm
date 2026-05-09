; DESCRIPTION: Composite: Places a orange line segment connecting (344, 64) to (499, 208) then Creates a red rectangular region at (191, 60) spanning 75 by 111 pixels.
; PLAN: r0=344(x1), r1=64(y1), r2=499(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=60(y), r7=75(width), r8=111(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 64
LDI r2, 499
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 60
LDI r7, 75
LDI r8, 111
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
