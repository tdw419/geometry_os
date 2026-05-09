; DESCRIPTION: Renders a orange line between points (455, 102) and (142, 231).
; PLAN: r0=455(x1), r1=102(y1), r2=142(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 102
LDI r2, 142
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
