; DESCRIPTION: Draws a black line from (196, 9) to (98, 183).
; PLAN: r0=196(x1), r1=9(y1), r2=98(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 9
LDI r2, 98
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
