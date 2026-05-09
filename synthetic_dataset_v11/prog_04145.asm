; DESCRIPTION: Places a cyan line segment connecting (208, 153) to (97, 255).
; PLAN: r0=208(x1), r1=153(y1), r2=97(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 153
LDI r2, 97
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
