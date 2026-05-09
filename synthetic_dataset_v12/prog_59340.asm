; DESCRIPTION: Draws a cyan line from (14, 191) to (395, 131).
; PLAN: r0=14(x1), r1=191(y1), r2=395(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 191
LDI r2, 395
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
