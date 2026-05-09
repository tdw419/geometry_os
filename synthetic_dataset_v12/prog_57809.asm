; DESCRIPTION: Draws a black line from (253, 12) to (143, 123).
; PLAN: r0=253(x1), r1=12(y1), r2=143(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 12
LDI r2, 143
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
