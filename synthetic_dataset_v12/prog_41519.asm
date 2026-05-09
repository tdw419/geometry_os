; DESCRIPTION: Draws a black line from (455, 194) to (492, 193).
; PLAN: r0=455(x1), r1=194(y1), r2=492(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 194
LDI r2, 492
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
