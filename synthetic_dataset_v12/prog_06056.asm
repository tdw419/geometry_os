; DESCRIPTION: Places a cyan line segment connecting (194, 65) to (322, 205).
; PLAN: r0=194(x1), r1=65(y1), r2=322(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 65
LDI r2, 322
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
