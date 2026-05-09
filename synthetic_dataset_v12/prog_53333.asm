; DESCRIPTION: Draws a black line from (399, 10) to (119, 68).
; PLAN: r0=399(x1), r1=10(y1), r2=119(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 10
LDI r2, 119
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
