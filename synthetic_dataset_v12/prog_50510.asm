; DESCRIPTION: Draws a yellow line from (288, 120) to (120, 140).
; PLAN: r0=288(x1), r1=120(y1), r2=120(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 120
LDI r2, 120
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
