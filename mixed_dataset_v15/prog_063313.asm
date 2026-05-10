; DESCRIPTION: Draws a purple line from (368, 210) to (351, 125).
; PLAN: r0=368(x1), r1=210(y1), r2=351(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 210
LDI r2, 351
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
