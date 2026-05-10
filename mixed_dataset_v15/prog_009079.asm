; DESCRIPTION: Draws a black line from (361, 31) to (440, 250).
; PLAN: r0=361(x1), r1=31(y1), r2=440(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 31
LDI r2, 440
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
