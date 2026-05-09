; DESCRIPTION: Draws a red line from (174, 120) to (1, 11).
; PLAN: r0=174(x1), r1=120(y1), r2=1(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 120
LDI r2, 1
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
