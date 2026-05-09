; DESCRIPTION: Draws a black line from (40, 114) to (146, 66).
; PLAN: r0=40(x1), r1=114(y1), r2=146(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 114
LDI r2, 146
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
