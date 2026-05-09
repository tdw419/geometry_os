; DESCRIPTION: Draws a red line from (231, 79) to (168, 94).
; PLAN: r0=231(x1), r1=79(y1), r2=168(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 79
LDI r2, 168
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
