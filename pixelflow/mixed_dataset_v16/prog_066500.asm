; DESCRIPTION: Draws a yellow line from (49, 11) to (322, 239).
; PLAN: r0=49(x1), r1=11(y1), r2=322(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 11
LDI r2, 322
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
