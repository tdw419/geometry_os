; DESCRIPTION: Draws a red line from (449, 185) to (426, 9).
; PLAN: r0=449(x1), r1=185(y1), r2=426(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 185
LDI r2, 426
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
