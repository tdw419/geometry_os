; DESCRIPTION: Draws a red line from (386, 65) to (6, 158).
; PLAN: r0=386(x1), r1=65(y1), r2=6(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 65
LDI r2, 6
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
