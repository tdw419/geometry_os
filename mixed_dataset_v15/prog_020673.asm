; DESCRIPTION: Places a cyan line segment connecting (248, 227) to (322, 180).
; PLAN: r0=248(x1), r1=227(y1), r2=322(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 227
LDI r2, 322
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
