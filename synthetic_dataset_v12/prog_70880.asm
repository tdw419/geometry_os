; DESCRIPTION: Composite: Draws a black rectangle at (370, 12) with width 81 and height 81 then Draws a green line from (132, 70) to (484, 196).
; PLAN: r0=370(x), r1=12(y), r2=81(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=70(y1), r7=484(x2), r8=196(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 12
LDI r2, 81
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 70
LDI r7, 484
LDI r8, 196
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
