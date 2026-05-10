; DESCRIPTION: Draws a yellow line from (344, 51) to (263, 33).
; PLAN: r0=344(x1), r1=51(y1), r2=263(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 51
LDI r2, 263
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
