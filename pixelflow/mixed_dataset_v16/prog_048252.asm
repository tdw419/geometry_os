; DESCRIPTION: Renders a orange line between points (238, 244) and (46, 206).
; PLAN: r0=238(x1), r1=244(y1), r2=46(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 244
LDI r2, 46
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
