; DESCRIPTION: Draws a yellow line from (322, 171) to (189, 208).
; PLAN: r0=322(x1), r1=171(y1), r2=189(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 171
LDI r2, 189
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
