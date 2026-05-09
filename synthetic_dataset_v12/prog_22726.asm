; DESCRIPTION: Draws a white line from (76, 161) to (471, 52).
; PLAN: r0=76(x1), r1=161(y1), r2=471(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 161
LDI r2, 471
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
