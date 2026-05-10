; DESCRIPTION: Draws a red line from (414, 35) to (490, 125).
; PLAN: r0=414(x1), r1=35(y1), r2=490(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 35
LDI r2, 490
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
