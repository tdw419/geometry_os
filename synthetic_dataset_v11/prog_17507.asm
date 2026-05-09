; DESCRIPTION: Places a white line segment connecting (81, 65) to (43, 155).
; PLAN: r0=81(x1), r1=65(y1), r2=43(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 65
LDI r2, 43
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
