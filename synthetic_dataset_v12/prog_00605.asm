; DESCRIPTION: Draws a orange line from (40, 1) to (317, 167).
; PLAN: r0=40(x1), r1=1(y1), r2=317(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 1
LDI r2, 317
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
