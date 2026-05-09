; DESCRIPTION: Draws a black line from (343, 72) to (206, 135).
; PLAN: r0=343(x1), r1=72(y1), r2=206(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 72
LDI r2, 206
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
