; DESCRIPTION: Draws a red line from (107, 178) to (150, 180).
; PLAN: r0=107(x1), r1=178(y1), r2=150(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 178
LDI r2, 150
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
