; DESCRIPTION: Draws a green line from (411, 183) to (102, 252).
; PLAN: r0=411(x1), r1=183(y1), r2=102(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 183
LDI r2, 102
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
