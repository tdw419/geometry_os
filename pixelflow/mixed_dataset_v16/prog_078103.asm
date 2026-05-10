; DESCRIPTION: Composite: Draws a magenta line from (118, 164) to (9, 81) then Places a magenta 65x33 rectangle at position (230, 33).
; PLAN: r0=118(x1), r1=164(y1), r2=9(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=33(y), r7=65(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 164
LDI r2, 9
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 33
LDI r7, 65
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
