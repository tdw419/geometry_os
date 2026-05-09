; DESCRIPTION: Draws a black line from (151, 217) to (220, 44).
; PLAN: r0=151(x1), r1=217(y1), r2=220(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 217
LDI r2, 220
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
