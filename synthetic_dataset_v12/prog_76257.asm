; DESCRIPTION: Composite: Places a red line segment connecting (408, 50) to (411, 57) then Draws a blue rectangle at (157, 111) with width 18 and height 56.
; PLAN: r0=408(x1), r1=50(y1), r2=411(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=111(y), r7=18(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 50
LDI r2, 411
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 111
LDI r7, 18
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
