; DESCRIPTION: Draws a green line from (76, 38) to (78, 35).
; PLAN: r0=76(x1), r1=38(y1), r2=78(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 38
LDI r2, 78
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
