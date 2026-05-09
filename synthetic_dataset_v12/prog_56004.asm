; DESCRIPTION: Places a yellow line segment connecting (177, 205) to (322, 31).
; PLAN: r0=177(x1), r1=205(y1), r2=322(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 205
LDI r2, 322
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
