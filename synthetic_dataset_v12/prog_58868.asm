; DESCRIPTION: Composite: Draws a yellow rectangle at (400, 91) with width 78 and height 86 then Draws a blue line from (199, 118) to (210, 82).
; PLAN: r0=400(x), r1=91(y), r2=78(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x1), r6=118(y1), r7=210(x2), r8=82(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 91
LDI r2, 78
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 118
LDI r7, 210
LDI r8, 82
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
