; DESCRIPTION: Draws a white line from (23, 102) to (94, 118).
; PLAN: r0=23(x1), r1=102(y1), r2=94(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 102
LDI r2, 94
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
