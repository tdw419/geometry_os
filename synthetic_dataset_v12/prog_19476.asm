; DESCRIPTION: Draws a black line from (426, 146) to (377, 188).
; PLAN: r0=426(x1), r1=146(y1), r2=377(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 146
LDI r2, 377
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
