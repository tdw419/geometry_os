; DESCRIPTION: Draws a green line from (171, 232) to (78, 65).
; PLAN: r0=171(x1), r1=232(y1), r2=78(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 232
LDI r2, 78
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
