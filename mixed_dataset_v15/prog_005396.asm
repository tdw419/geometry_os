; DESCRIPTION: Draws a green line from (163, 91) to (126, 85).
; PLAN: r0=163(x1), r1=91(y1), r2=126(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 91
LDI r2, 126
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
