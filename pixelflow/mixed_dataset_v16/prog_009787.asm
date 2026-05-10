; DESCRIPTION: Renders a white line between points (44, 88) and (191, 231).
; PLAN: r0=44(x1), r1=88(y1), r2=191(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 88
LDI r2, 191
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
