; DESCRIPTION: Draws a green line from (297, 5) to (112, 188).
; PLAN: r0=297(x1), r1=5(y1), r2=112(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 5
LDI r2, 112
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
