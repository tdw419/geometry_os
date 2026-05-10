; DESCRIPTION: Composite: Draws a magenta rectangle at (180, 64) with width 31 and height 103 then Draws a red line from (229, 247) to (506, 30).
; PLAN: r0=180(x), r1=64(y), r2=31(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x1), r6=247(y1), r7=506(x2), r8=30(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 64
LDI r2, 31
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 247
LDI r7, 506
LDI r8, 30
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
