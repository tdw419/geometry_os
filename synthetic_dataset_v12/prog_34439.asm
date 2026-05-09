; DESCRIPTION: Draws a yellow line from (322, 111) to (462, 124).
; PLAN: r0=322(x1), r1=111(y1), r2=462(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 111
LDI r2, 462
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
