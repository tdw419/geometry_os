; DESCRIPTION: Draws a white line from (110, 167) to (58, 23).
; PLAN: r0=110(x1), r1=167(y1), r2=58(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 167
LDI r2, 58
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
