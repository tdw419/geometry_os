; DESCRIPTION: Draws a orange line from (230, 1) to (264, 198).
; PLAN: r0=230(x1), r1=1(y1), r2=264(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 1
LDI r2, 264
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
