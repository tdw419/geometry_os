; DESCRIPTION: Composite: Creates a blue rectangular region at (161, 87) spanning 101 by 62 pixels then Draws a white line from (363, 184) to (173, 202).
; PLAN: r0=161(x), r1=87(y), r2=101(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x1), r6=184(y1), r7=173(x2), r8=202(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 87
LDI r2, 101
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 184
LDI r7, 173
LDI r8, 202
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
