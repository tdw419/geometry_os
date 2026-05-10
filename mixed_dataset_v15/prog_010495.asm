; DESCRIPTION: Composite: Draws a magenta rectangle at (414, 20) with width 13 and height 109 then Draws a blue line from (304, 218) to (326, 242).
; PLAN: r0=414(x), r1=20(y), r2=13(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x1), r6=218(y1), r7=326(x2), r8=242(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 20
LDI r2, 13
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 218
LDI r7, 326
LDI r8, 242
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
