; DESCRIPTION: Composite: Renders a black line between points (249, 58) and (180, 73) then Creates a blue rectangular region at (88, 122) spanning 18 by 97 pixels.
; PLAN: r0=249(x1), r1=58(y1), r2=180(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=122(y), r7=18(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 58
LDI r2, 180
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 122
LDI r7, 18
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
