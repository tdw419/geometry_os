; DESCRIPTION: Draws a black line from (121, 209) to (475, 33).
; PLAN: r0=121(x1), r1=209(y1), r2=475(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 209
LDI r2, 475
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
