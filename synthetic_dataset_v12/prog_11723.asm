; DESCRIPTION: Draws a black line from (199, 240) to (221, 56).
; PLAN: r0=199(x1), r1=240(y1), r2=221(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 240
LDI r2, 221
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
