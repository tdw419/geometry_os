; DESCRIPTION: Draws a yellow line from (39, 110) to (209, 51).
; PLAN: r0=39(x1), r1=110(y1), r2=209(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 110
LDI r2, 209
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
