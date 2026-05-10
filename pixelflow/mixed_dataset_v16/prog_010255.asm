; DESCRIPTION: Composite: Draws a white rectangle at (277, 38) with width 110 and height 120 then Draws a magenta line from (109, 31) to (236, 177).
; PLAN: r0=277(x), r1=38(y), r2=110(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=31(y1), r7=236(x2), r8=177(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 38
LDI r2, 110
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 31
LDI r7, 236
LDI r8, 177
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
