; DESCRIPTION: Places a cyan line segment connecting (38, 51) to (334, 45).
; PLAN: r0=38(x1), r1=51(y1), r2=334(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 51
LDI r2, 334
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
