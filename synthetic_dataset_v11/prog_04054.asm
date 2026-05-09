; DESCRIPTION: Draws a green line from (89, 188) to (214, 254).
; PLAN: r0=89(x1), r1=188(y1), r2=214(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 188
LDI r2, 214
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
