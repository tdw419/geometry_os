; DESCRIPTION: Composite: Draws a purple line from (263, 228) to (408, 181) then Draws a cyan rectangle at (247, 178) with width 100 and height 59.
; PLAN: r0=263(x1), r1=228(y1), r2=408(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=178(y), r7=100(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 228
LDI r2, 408
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 178
LDI r7, 100
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
