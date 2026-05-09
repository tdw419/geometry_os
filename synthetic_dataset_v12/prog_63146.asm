; DESCRIPTION: Draws a green line from (436, 51) to (52, 98).
; PLAN: r0=436(x1), r1=51(y1), r2=52(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 51
LDI r2, 52
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
