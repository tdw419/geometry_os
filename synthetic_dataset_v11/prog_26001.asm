; DESCRIPTION: Renders a orange line between points (189, 161) and (18, 236).
; PLAN: r0=189(x1), r1=161(y1), r2=18(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 161
LDI r2, 18
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
