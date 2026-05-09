; DESCRIPTION: Draws a white line from (81, 252) to (301, 196).
; PLAN: r0=81(x1), r1=252(y1), r2=301(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 252
LDI r2, 301
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
