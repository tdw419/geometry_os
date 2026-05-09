; DESCRIPTION: Draws a black line from (511, 5) to (291, 138).
; PLAN: r0=511(x1), r1=5(y1), r2=291(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 5
LDI r2, 291
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
