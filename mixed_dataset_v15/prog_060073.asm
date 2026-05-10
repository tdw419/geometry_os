; DESCRIPTION: Composite: Places a yellow circle of radius 74 at center (185, 135) then Draws a green line from (371, 117) to (158, 60).
; PLAN: r0=185(x), r1=135(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x1), r6=117(y1), r7=158(x2), r8=60(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 135
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 117
LDI r7, 158
LDI r8, 60
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
