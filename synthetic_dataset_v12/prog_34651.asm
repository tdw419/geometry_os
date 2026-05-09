; DESCRIPTION: Places a cyan line segment connecting (323, 59) to (358, 96).
; PLAN: r0=323(x1), r1=59(y1), r2=358(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 59
LDI r2, 358
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
