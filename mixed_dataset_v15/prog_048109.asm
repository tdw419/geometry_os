; DESCRIPTION: Renders a white line between points (229, 187) and (191, 97).
; PLAN: r0=229(x1), r1=187(y1), r2=191(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 187
LDI r2, 191
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
