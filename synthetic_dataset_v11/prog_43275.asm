; DESCRIPTION: Draws a black line from (84, 202) to (81, 200).
; PLAN: r0=84(x1), r1=202(y1), r2=81(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 202
LDI r2, 81
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
