; DESCRIPTION: Draws a white line from (102, 167) to (91, 89).
; PLAN: r0=102(x1), r1=167(y1), r2=91(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 167
LDI r2, 91
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
