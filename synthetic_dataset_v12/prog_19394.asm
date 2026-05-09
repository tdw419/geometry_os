; DESCRIPTION: Draws a red line from (279, 123) to (17, 7).
; PLAN: r0=279(x1), r1=123(y1), r2=17(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 123
LDI r2, 17
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
