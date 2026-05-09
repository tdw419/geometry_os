; DESCRIPTION: Draws a green line from (120, 184) to (63, 216).
; PLAN: r0=120(x1), r1=184(y1), r2=63(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 184
LDI r2, 63
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
