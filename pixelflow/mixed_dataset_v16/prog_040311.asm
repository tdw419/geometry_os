; DESCRIPTION: Places a cyan line segment connecting (133, 133) to (335, 124).
; PLAN: r0=133(x1), r1=133(y1), r2=335(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 133
LDI r2, 335
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
