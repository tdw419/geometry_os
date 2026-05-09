; DESCRIPTION: Draws a green line from (261, 200) to (326, 85).
; PLAN: r0=261(x1), r1=200(y1), r2=326(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 200
LDI r2, 326
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
