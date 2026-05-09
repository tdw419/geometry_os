; DESCRIPTION: Places a cyan line segment connecting (241, 145) to (9, 38).
; PLAN: r0=241(x1), r1=145(y1), r2=9(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 145
LDI r2, 9
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
