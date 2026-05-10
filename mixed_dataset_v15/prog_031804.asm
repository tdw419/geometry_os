; DESCRIPTION: Composite: Draws a purple line from (165, 105) to (449, 229) then Renders a black box of size 106x47 starting at (133, 15).
; PLAN: r0=165(x1), r1=105(y1), r2=449(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=15(y), r7=106(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 105
LDI r2, 449
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 15
LDI r7, 106
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
