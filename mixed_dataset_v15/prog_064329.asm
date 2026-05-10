; DESCRIPTION: Composite: Places a red line segment connecting (221, 170) to (263, 16) then Draws a orange rectangle at (48, 95) with width 82 and height 92.
; PLAN: r0=221(x1), r1=170(y1), r2=263(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=95(y), r7=82(width), r8=92(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 170
LDI r2, 263
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 95
LDI r7, 82
LDI r8, 92
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
