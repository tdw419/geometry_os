; DESCRIPTION: Draws a green line from (0, 202) to (91, 106).
; PLAN: r0=0(x1), r1=202(y1), r2=91(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 202
LDI r2, 91
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
