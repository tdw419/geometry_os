; DESCRIPTION: Draws a green line from (405, 8) to (322, 123).
; PLAN: r0=405(x1), r1=8(y1), r2=322(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 8
LDI r2, 322
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
