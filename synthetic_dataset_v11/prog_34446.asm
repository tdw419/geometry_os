; DESCRIPTION: Draws a red line from (54, 198) to (32, 161).
; PLAN: r0=54(x1), r1=198(y1), r2=32(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 198
LDI r2, 32
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
