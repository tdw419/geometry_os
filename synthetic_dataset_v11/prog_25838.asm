; DESCRIPTION: Draws a red line from (6, 18) to (98, 170).
; PLAN: r0=6(x1), r1=18(y1), r2=98(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 18
LDI r2, 98
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
