; DESCRIPTION: Renders a white line between points (84, 187) and (249, 11).
; PLAN: r0=84(x1), r1=187(y1), r2=249(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 187
LDI r2, 249
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
