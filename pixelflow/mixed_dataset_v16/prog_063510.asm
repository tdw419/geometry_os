; DESCRIPTION: Draws a black line from (343, 174) to (346, 233).
; PLAN: r0=343(x1), r1=174(y1), r2=346(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 174
LDI r2, 346
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
