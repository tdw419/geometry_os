; DESCRIPTION: Draws a yellow line from (210, 89) to (252, 71).
; PLAN: r0=210(x1), r1=89(y1), r2=252(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 89
LDI r2, 252
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
