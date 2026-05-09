; DESCRIPTION: Places a cyan line segment connecting (261, 191) to (122, 109).
; PLAN: r0=261(x1), r1=191(y1), r2=122(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 191
LDI r2, 122
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
