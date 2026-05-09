; DESCRIPTION: Draws a white line from (115, 22) to (19, 168).
; PLAN: r0=115(x1), r1=22(y1), r2=19(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 22
LDI r2, 19
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
