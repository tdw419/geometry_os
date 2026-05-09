; DESCRIPTION: Draws a black line from (5, 115) to (35, 196).
; PLAN: r0=5(x1), r1=115(y1), r2=35(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 115
LDI r2, 35
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
