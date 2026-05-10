; DESCRIPTION: Draws a blue line from (71, 56) to (252, 98).
; PLAN: r0=71(x1), r1=56(y1), r2=252(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 56
LDI r2, 252
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
