; DESCRIPTION: Places a cyan line segment connecting (47, 1) to (147, 226).
; PLAN: r0=47(x1), r1=1(y1), r2=147(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 1
LDI r2, 147
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
