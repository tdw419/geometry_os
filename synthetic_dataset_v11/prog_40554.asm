; DESCRIPTION: Draws a red line from (27, 201) to (229, 180).
; PLAN: r0=27(x1), r1=201(y1), r2=229(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 201
LDI r2, 229
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
