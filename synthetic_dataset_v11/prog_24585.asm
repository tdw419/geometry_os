; DESCRIPTION: Draws a green line from (12, 167) to (47, 51).
; PLAN: r0=12(x1), r1=167(y1), r2=47(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 167
LDI r2, 47
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
