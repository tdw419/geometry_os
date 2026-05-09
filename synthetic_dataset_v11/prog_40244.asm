; DESCRIPTION: Draws a red line from (46, 149) to (3, 105).
; PLAN: r0=46(x1), r1=149(y1), r2=3(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 149
LDI r2, 3
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
