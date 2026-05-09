; DESCRIPTION: Draws a red line from (375, 120) to (6, 66).
; PLAN: r0=375(x1), r1=120(y1), r2=6(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 120
LDI r2, 6
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
