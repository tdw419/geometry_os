; DESCRIPTION: Draws a black line from (79, 131) to (441, 59).
; PLAN: r0=79(x1), r1=131(y1), r2=441(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 131
LDI r2, 441
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
