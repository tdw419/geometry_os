; DESCRIPTION: Draws a green line from (2, 51) to (285, 50).
; PLAN: r0=2(x1), r1=51(y1), r2=285(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 51
LDI r2, 285
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
