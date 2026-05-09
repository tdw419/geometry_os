; DESCRIPTION: Draws a black line from (7, 111) to (84, 17).
; PLAN: r0=7(x1), r1=111(y1), r2=84(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 111
LDI r2, 84
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
