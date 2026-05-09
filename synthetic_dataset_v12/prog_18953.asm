; DESCRIPTION: Draws a green line from (97, 200) to (183, 134).
; PLAN: r0=97(x1), r1=200(y1), r2=183(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 200
LDI r2, 183
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
