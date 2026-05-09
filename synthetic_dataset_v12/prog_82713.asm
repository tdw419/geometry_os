; DESCRIPTION: Draws a black line from (361, 126) to (236, 172).
; PLAN: r0=361(x1), r1=126(y1), r2=236(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 126
LDI r2, 236
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
