; DESCRIPTION: Draws a green line from (22, 117) to (463, 186).
; PLAN: r0=22(x1), r1=117(y1), r2=463(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 117
LDI r2, 463
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
