; DESCRIPTION: Draws a red line from (366, 46) to (3, 146).
; PLAN: r0=366(x1), r1=46(y1), r2=3(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 46
LDI r2, 3
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
