; DESCRIPTION: Draws a black line from (380, 156) to (174, 142).
; PLAN: r0=380(x1), r1=156(y1), r2=174(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 156
LDI r2, 174
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
