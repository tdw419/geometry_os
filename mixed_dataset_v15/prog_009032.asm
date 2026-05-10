; DESCRIPTION: Draws a green line from (252, 166) to (161, 25).
; PLAN: r0=252(x1), r1=166(y1), r2=161(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 166
LDI r2, 161
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
