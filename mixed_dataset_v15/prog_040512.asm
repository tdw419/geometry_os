; DESCRIPTION: Draws a yellow line from (471, 46) to (477, 68).
; PLAN: r0=471(x1), r1=46(y1), r2=477(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 46
LDI r2, 477
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
