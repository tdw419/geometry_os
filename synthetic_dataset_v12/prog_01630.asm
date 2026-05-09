; DESCRIPTION: Draws a white line from (328, 31) to (58, 85).
; PLAN: r0=328(x1), r1=31(y1), r2=58(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 31
LDI r2, 58
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
