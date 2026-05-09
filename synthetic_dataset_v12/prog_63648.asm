; DESCRIPTION: Draws a white line from (161, 149) to (359, 133).
; PLAN: r0=161(x1), r1=149(y1), r2=359(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 149
LDI r2, 359
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
