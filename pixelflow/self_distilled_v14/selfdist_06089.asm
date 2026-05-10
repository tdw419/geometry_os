; DESCRIPTION: Renders a green line segment connecting (344, 51) to (31, 8).
; PLAN: r0=344(x1), r1=51(y1), r2=31(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 51
LDI r2, 31
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
