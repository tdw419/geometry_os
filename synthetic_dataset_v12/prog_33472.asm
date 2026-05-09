; DESCRIPTION: Renders a black line between points (25, 178) and (128, 181).
; PLAN: r0=25(x1), r1=178(y1), r2=128(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 178
LDI r2, 128
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
