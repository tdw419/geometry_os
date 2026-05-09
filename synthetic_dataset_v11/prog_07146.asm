; DESCRIPTION: Draws a black line from (74, 84) to (66, 131).
; PLAN: r0=74(x1), r1=84(y1), r2=66(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 84
LDI r2, 66
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
