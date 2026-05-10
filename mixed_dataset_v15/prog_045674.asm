; DESCRIPTION: Places a cyan line segment connecting (26, 238) to (486, 92).
; PLAN: r0=26(x1), r1=238(y1), r2=486(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 238
LDI r2, 486
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
