; DESCRIPTION: Places a red line segment connecting (283, 184) to (322, 51).
; PLAN: r0=283(x1), r1=184(y1), r2=322(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 184
LDI r2, 322
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
