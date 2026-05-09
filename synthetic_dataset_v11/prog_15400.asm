; DESCRIPTION: Places a cyan line segment connecting (237, 147) to (45, 77).
; PLAN: r0=237(x1), r1=147(y1), r2=45(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 147
LDI r2, 45
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
