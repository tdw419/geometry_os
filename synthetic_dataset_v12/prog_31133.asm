; DESCRIPTION: Draws a black line from (31, 224) to (25, 124).
; PLAN: r0=31(x1), r1=224(y1), r2=25(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 224
LDI r2, 25
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
