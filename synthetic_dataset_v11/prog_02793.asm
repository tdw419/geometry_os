; DESCRIPTION: Draws a green line from (99, 252) to (66, 168).
; PLAN: r0=99(x1), r1=252(y1), r2=66(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 252
LDI r2, 66
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
