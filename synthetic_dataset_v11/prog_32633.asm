; DESCRIPTION: Draws a green line from (112, 58) to (106, 86).
; PLAN: r0=112(x1), r1=58(y1), r2=106(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 58
LDI r2, 106
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
