; DESCRIPTION: Draws a black line from (380, 3) to (142, 44).
; PLAN: r0=380(x1), r1=3(y1), r2=142(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 3
LDI r2, 142
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
