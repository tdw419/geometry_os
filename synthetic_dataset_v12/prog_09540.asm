; DESCRIPTION: Composite: Places a red 81x69 rectangle at position (135, 110) then Draws a blue line from (230, 64) to (251, 7).
; PLAN: r0=135(x), r1=110(y), r2=81(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=64(y1), r7=251(x2), r8=7(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 110
LDI r2, 81
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 64
LDI r7, 251
LDI r8, 7
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
