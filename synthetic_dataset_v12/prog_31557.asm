; DESCRIPTION: Draws a red line from (370, 9) to (111, 78).
; PLAN: r0=370(x1), r1=9(y1), r2=111(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 9
LDI r2, 111
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
