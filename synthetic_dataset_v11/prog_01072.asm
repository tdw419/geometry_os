; DESCRIPTION: Places a cyan line segment connecting (172, 191) to (222, 133).
; PLAN: r0=172(x1), r1=191(y1), r2=222(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 191
LDI r2, 222
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
