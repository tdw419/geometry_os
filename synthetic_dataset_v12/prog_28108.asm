; DESCRIPTION: Draws a yellow line from (250, 204) to (462, 243).
; PLAN: r0=250(x1), r1=204(y1), r2=462(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 204
LDI r2, 462
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
