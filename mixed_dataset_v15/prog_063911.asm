; DESCRIPTION: Draws a red line from (392, 197) to (95, 185).
; PLAN: r0=392(x1), r1=197(y1), r2=95(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 197
LDI r2, 95
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
