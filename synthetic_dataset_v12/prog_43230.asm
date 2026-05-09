; DESCRIPTION: Draws a red line from (455, 241) to (324, 249).
; PLAN: r0=455(x1), r1=241(y1), r2=324(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 241
LDI r2, 324
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
