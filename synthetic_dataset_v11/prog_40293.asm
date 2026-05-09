; DESCRIPTION: Draws a black line from (1, 252) to (253, 59).
; PLAN: r0=1(x1), r1=252(y1), r2=253(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 252
LDI r2, 253
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
