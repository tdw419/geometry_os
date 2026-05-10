; DESCRIPTION: Draws a black line from (128, 81) to (177, 230).
; PLAN: r0=128(x1), r1=81(y1), r2=177(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 81
LDI r2, 177
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
