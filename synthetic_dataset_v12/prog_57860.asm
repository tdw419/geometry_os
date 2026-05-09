; DESCRIPTION: Composite: Draws a orange line from (308, 35) to (477, 198) then Renders a purple box of size 106x85 starting at (352, 14).
; PLAN: r0=308(x1), r1=35(y1), r2=477(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=14(y), r7=106(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 35
LDI r2, 477
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 14
LDI r7, 106
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
