; DESCRIPTION: Places a cyan line segment connecting (102, 169) to (77, 195).
; PLAN: r0=102(x1), r1=169(y1), r2=77(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 169
LDI r2, 77
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
