; DESCRIPTION: Renders a white line between points (84, 231) and (444, 11).
; PLAN: r0=84(x1), r1=231(y1), r2=444(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 231
LDI r2, 444
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
