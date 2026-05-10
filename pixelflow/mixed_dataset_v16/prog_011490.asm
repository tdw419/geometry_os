; DESCRIPTION: Draws a black line from (193, 135) to (491, 13).
; PLAN: r0=193(x1), r1=135(y1), r2=491(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 135
LDI r2, 491
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
