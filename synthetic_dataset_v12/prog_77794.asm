; DESCRIPTION: Draws a black line from (309, 22) to (418, 164).
; PLAN: r0=309(x1), r1=22(y1), r2=418(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 22
LDI r2, 418
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
