; DESCRIPTION: Composite: Places a magenta 110x92 rectangle at position (26, 121) then Draws a magenta line from (65, 185) to (403, 24).
; PLAN: r0=26(x), r1=121(y), r2=110(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=185(y1), r7=403(x2), r8=24(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 121
LDI r2, 110
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 185
LDI r7, 403
LDI r8, 24
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
