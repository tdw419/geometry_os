; DESCRIPTION: Draws a black line from (307, 75) to (3, 77).
; PLAN: r0=307(x1), r1=75(y1), r2=3(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 75
LDI r2, 3
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
