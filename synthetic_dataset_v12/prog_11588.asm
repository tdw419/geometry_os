; DESCRIPTION: Draws a red line from (75, 202) to (71, 38).
; PLAN: r0=75(x1), r1=202(y1), r2=71(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 202
LDI r2, 71
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
