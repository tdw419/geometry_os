; DESCRIPTION: Draws a black line from (66, 243) to (36, 135).
; PLAN: r0=66(x1), r1=243(y1), r2=36(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 243
LDI r2, 36
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
