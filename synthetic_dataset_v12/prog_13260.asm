; DESCRIPTION: Composite: Draws a magenta rectangle at (428, 108) with width 15 and height 87 then Draws a white line from (166, 0) to (434, 87).
; PLAN: r0=428(x), r1=108(y), r2=15(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x1), r6=0(y1), r7=434(x2), r8=87(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 108
LDI r2, 15
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 0
LDI r7, 434
LDI r8, 87
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
