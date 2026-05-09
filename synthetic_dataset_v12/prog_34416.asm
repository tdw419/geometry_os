; DESCRIPTION: Places a green line segment connecting (90, 95) to (322, 171).
; PLAN: r0=90(x1), r1=95(y1), r2=322(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 95
LDI r2, 322
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
