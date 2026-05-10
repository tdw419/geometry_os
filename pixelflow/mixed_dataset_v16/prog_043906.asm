; DESCRIPTION: Composite: Draws a white line from (448, 176) to (123, 89) then Draws a white rectangle at (279, 70) with width 19 and height 25.
; PLAN: r0=448(x1), r1=176(y1), r2=123(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=70(y), r7=19(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 176
LDI r2, 123
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 70
LDI r7, 19
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
