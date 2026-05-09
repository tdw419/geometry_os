; DESCRIPTION: Draws a black line from (323, 60) to (501, 146).
; PLAN: r0=323(x1), r1=60(y1), r2=501(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 60
LDI r2, 501
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
