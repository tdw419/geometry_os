; DESCRIPTION: Draws a white line from (13, 185) to (161, 65).
; PLAN: r0=13(x1), r1=185(y1), r2=161(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 185
LDI r2, 161
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
