; DESCRIPTION: Draws a black line from (365, 43) to (271, 87).
; PLAN: r0=365(x1), r1=43(y1), r2=271(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 43
LDI r2, 271
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
