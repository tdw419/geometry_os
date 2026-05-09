; DESCRIPTION: Draws a red line from (94, 172) to (143, 243).
; PLAN: r0=94(x1), r1=172(y1), r2=143(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 172
LDI r2, 143
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
