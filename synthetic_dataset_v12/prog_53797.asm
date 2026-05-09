; DESCRIPTION: Places a cyan line segment connecting (322, 176) to (163, 179).
; PLAN: r0=322(x1), r1=176(y1), r2=163(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 176
LDI r2, 163
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
