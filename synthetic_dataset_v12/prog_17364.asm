; DESCRIPTION: Draws a green line from (106, 159) to (175, 58).
; PLAN: r0=106(x1), r1=159(y1), r2=175(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 159
LDI r2, 175
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
