; DESCRIPTION: Draws a green line from (25, 204) to (4, 149).
; PLAN: r0=25(x1), r1=204(y1), r2=4(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 204
LDI r2, 4
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
