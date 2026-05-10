; DESCRIPTION: Draws a black line from (343, 148) to (164, 91).
; PLAN: r0=343(x1), r1=148(y1), r2=164(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 148
LDI r2, 164
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
