; DESCRIPTION: Composite: Creates a blue rectangular region at (269, 82) spanning 99 by 103 pixels then Draws a green line from (15, 35) to (349, 229).
; PLAN: r0=269(x), r1=82(y), r2=99(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=35(y1), r7=349(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 82
LDI r2, 99
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 35
LDI r7, 349
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
