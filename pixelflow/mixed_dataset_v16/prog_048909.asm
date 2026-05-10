; DESCRIPTION: Draws a black line from (8, 70) to (491, 209).
; PLAN: r0=8(x1), r1=70(y1), r2=491(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 70
LDI r2, 491
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
