; DESCRIPTION: Draws a red line from (423, 183) to (410, 93).
; PLAN: r0=423(x1), r1=183(y1), r2=410(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 183
LDI r2, 410
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
