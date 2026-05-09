; DESCRIPTION: Draws a red line from (143, 188) to (172, 141).
; PLAN: r0=143(x1), r1=188(y1), r2=172(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 188
LDI r2, 172
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
