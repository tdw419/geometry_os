; DESCRIPTION: Draws a cyan line from (89, 191) to (368, 0).
; PLAN: r0=89(x1), r1=191(y1), r2=368(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 191
LDI r2, 368
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
