; DESCRIPTION: Draws a black line from (53, 180) to (444, 14).
; PLAN: r0=53(x1), r1=180(y1), r2=444(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 180
LDI r2, 444
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
