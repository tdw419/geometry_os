; DESCRIPTION: Draws a green line from (46, 26) to (151, 51).
; PLAN: r0=46(x1), r1=26(y1), r2=151(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 26
LDI r2, 151
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
