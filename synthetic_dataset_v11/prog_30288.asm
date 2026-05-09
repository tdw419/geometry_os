; DESCRIPTION: Draws a red line from (250, 3) to (20, 33).
; PLAN: r0=250(x1), r1=3(y1), r2=20(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 3
LDI r2, 20
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
