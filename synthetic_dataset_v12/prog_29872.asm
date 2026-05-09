; DESCRIPTION: Draws a green line from (409, 238) to (62, 109).
; PLAN: r0=409(x1), r1=238(y1), r2=62(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 238
LDI r2, 62
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
