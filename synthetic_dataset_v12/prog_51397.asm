; DESCRIPTION: Draws a white line from (36, 252) to (243, 208).
; PLAN: r0=36(x1), r1=252(y1), r2=243(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 252
LDI r2, 243
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
