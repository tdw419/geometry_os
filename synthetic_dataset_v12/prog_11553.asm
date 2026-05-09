; DESCRIPTION: Places a cyan line segment connecting (140, 249) to (388, 72).
; PLAN: r0=140(x1), r1=249(y1), r2=388(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 249
LDI r2, 388
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
