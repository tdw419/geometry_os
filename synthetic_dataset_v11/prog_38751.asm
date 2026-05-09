; DESCRIPTION: Places a cyan line segment connecting (124, 169) to (221, 24).
; PLAN: r0=124(x1), r1=169(y1), r2=221(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 169
LDI r2, 221
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
