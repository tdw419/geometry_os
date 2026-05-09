; DESCRIPTION: Draws a black line from (101, 72) to (71, 186).
; PLAN: r0=101(x1), r1=72(y1), r2=71(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 72
LDI r2, 71
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
