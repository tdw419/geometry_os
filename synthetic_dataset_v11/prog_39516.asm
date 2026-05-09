; DESCRIPTION: Draws a black line from (164, 44) to (164, 137).
; PLAN: r0=164(x1), r1=44(y1), r2=164(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 44
LDI r2, 164
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
