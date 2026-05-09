; DESCRIPTION: Draws a black line from (128, 49) to (124, 10).
; PLAN: r0=128(x1), r1=49(y1), r2=124(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 49
LDI r2, 124
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
