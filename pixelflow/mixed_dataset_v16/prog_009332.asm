; DESCRIPTION: Draws a black line from (273, 56) to (426, 6).
; PLAN: r0=273(x1), r1=56(y1), r2=426(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 56
LDI r2, 426
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
