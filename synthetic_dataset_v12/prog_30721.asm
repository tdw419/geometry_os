; DESCRIPTION: Draws a green line from (389, 209) to (151, 2).
; PLAN: r0=389(x1), r1=209(y1), r2=151(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 209
LDI r2, 151
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
