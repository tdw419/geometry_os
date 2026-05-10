; DESCRIPTION: Draws a black line from (420, 210) to (121, 17).
; PLAN: r0=420(x1), r1=210(y1), r2=121(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 210
LDI r2, 121
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
