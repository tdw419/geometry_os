; DESCRIPTION: Renders a orange line between points (63, 230) and (206, 23).
; PLAN: r0=63(x1), r1=230(y1), r2=206(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 230
LDI r2, 206
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
