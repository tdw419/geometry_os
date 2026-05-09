; DESCRIPTION: Composite: Places a purple 20x33 rectangle at position (7, 218) then Draws a blue line from (159, 3) to (167, 194).
; PLAN: r0=7(x), r1=218(y), r2=20(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x1), r6=3(y1), r7=167(x2), r8=194(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 218
LDI r2, 20
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 3
LDI r7, 167
LDI r8, 194
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
