; DESCRIPTION: Draws a blue line from (319, 25) to (399, 183).
; PLAN: r0=319(x1), r1=25(y1), r2=399(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 25
LDI r2, 399
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
