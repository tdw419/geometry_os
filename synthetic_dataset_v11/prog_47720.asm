; DESCRIPTION: Draws a red line from (107, 161) to (108, 86).
; PLAN: r0=107(x1), r1=161(y1), r2=108(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 161
LDI r2, 108
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
