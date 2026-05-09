; DESCRIPTION: Composite: Draws a white rectangle at (196, 38) with width 90 and height 113 then Draws a magenta line from (249, 181) to (89, 109).
; PLAN: r0=196(x), r1=38(y), r2=90(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=181(y1), r7=89(x2), r8=109(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 38
LDI r2, 90
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 181
LDI r7, 89
LDI r8, 109
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
