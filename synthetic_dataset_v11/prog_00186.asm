; DESCRIPTION: Draws a green line from (200, 178) to (211, 73).
; PLAN: r0=200(x1), r1=178(y1), r2=211(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 178
LDI r2, 211
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
