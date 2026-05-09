; DESCRIPTION: Renders a orange line between points (161, 231) and (105, 202).
; PLAN: r0=161(x1), r1=231(y1), r2=105(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 231
LDI r2, 105
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
