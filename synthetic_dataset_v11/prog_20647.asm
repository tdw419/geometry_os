; DESCRIPTION: Renders a black line between points (44, 149) and (231, 74).
; PLAN: r0=44(x1), r1=149(y1), r2=231(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 149
LDI r2, 231
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
