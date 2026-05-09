; DESCRIPTION: Draws a yellow line from (252, 77) to (138, 20).
; PLAN: r0=252(x1), r1=77(y1), r2=138(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 77
LDI r2, 138
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
