; DESCRIPTION: Places a cyan line segment connecting (241, 9) to (145, 14).
; PLAN: r0=241(x1), r1=9(y1), r2=145(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 9
LDI r2, 145
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
