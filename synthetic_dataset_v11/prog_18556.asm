; DESCRIPTION: Draws a black line from (73, 28) to (24, 81).
; PLAN: r0=73(x1), r1=28(y1), r2=24(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 28
LDI r2, 24
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
