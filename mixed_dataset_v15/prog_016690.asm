; DESCRIPTION: Renders a orange line between points (249, 231) and (398, 183).
; PLAN: r0=249(x1), r1=231(y1), r2=398(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 231
LDI r2, 398
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
