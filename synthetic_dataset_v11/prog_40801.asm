; DESCRIPTION: Places a cyan line segment connecting (73, 133) to (229, 90).
; PLAN: r0=73(x1), r1=133(y1), r2=229(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 133
LDI r2, 229
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
