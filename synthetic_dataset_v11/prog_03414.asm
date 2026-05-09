; DESCRIPTION: Draws a green line from (97, 19) to (112, 73).
; PLAN: r0=97(x1), r1=19(y1), r2=112(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 19
LDI r2, 112
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
