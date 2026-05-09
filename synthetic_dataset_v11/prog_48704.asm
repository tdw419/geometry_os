; DESCRIPTION: Draws a green line from (249, 55) to (22, 2).
; PLAN: r0=249(x1), r1=55(y1), r2=22(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 55
LDI r2, 22
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
