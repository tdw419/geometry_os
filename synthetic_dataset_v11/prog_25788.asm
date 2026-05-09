; DESCRIPTION: Draws a black line from (156, 48) to (226, 181).
; PLAN: r0=156(x1), r1=48(y1), r2=226(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 48
LDI r2, 226
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
