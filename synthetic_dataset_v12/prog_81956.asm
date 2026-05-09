; DESCRIPTION: Draws a purple line from (120, 2) to (327, 129).
; PLAN: r0=120(x1), r1=2(y1), r2=327(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 2
LDI r2, 327
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
