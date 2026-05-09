; DESCRIPTION: Draws a magenta line from (193, 41) to (231, 180).
; PLAN: r0=193(x1), r1=41(y1), r2=231(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 41
LDI r2, 231
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
