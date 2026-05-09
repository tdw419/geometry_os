; DESCRIPTION: Draws a green line from (491, 63) to (108, 216).
; PLAN: r0=491(x1), r1=63(y1), r2=108(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 63
LDI r2, 108
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
