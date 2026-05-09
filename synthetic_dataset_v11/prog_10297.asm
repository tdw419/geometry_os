; DESCRIPTION: Draws a red line from (75, 167) to (220, 9).
; PLAN: r0=75(x1), r1=167(y1), r2=220(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 167
LDI r2, 220
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
