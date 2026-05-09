; DESCRIPTION: Composite: Draws a magenta rectangle at (133, 19) with width 108 and height 50 then Draws a blue line from (326, 73) to (327, 72).
; PLAN: r0=133(x), r1=19(y), r2=108(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x1), r6=73(y1), r7=327(x2), r8=72(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 19
LDI r2, 108
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 73
LDI r7, 327
LDI r8, 72
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
