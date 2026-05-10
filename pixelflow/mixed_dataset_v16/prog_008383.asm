; DESCRIPTION: Places a red line segment connecting (196, 198) to (71, 91).
; PLAN: r0=196(x1), r1=198(y1), r2=71(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 198
LDI r2, 71
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
