; DESCRIPTION: Composite: Draws a blue line from (334, 121) to (193, 207) then Draws a black rectangle at (444, 71) with width 30 and height 114.
; PLAN: r0=334(x1), r1=121(y1), r2=193(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=71(y), r7=30(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 121
LDI r2, 193
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 71
LDI r7, 30
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
