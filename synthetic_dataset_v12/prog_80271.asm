; DESCRIPTION: Draws a black line from (8, 103) to (301, 8).
; PLAN: r0=8(x1), r1=103(y1), r2=301(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 103
LDI r2, 301
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
