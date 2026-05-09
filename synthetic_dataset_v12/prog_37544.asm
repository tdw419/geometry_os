; DESCRIPTION: Draws a orange line from (220, 161) to (443, 96).
; PLAN: r0=220(x1), r1=161(y1), r2=443(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 161
LDI r2, 443
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
