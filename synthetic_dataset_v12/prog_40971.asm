; DESCRIPTION: Draws a green line from (38, 66) to (471, 141).
; PLAN: r0=38(x1), r1=66(y1), r2=471(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 66
LDI r2, 471
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
