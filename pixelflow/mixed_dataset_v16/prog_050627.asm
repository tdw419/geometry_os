; DESCRIPTION: Draws a black line from (44, 114) to (193, 163).
; PLAN: r0=44(x1), r1=114(y1), r2=193(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 114
LDI r2, 193
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
