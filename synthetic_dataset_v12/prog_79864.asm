; DESCRIPTION: Places a cyan line segment connecting (36, 95) to (117, 211).
; PLAN: r0=36(x1), r1=95(y1), r2=117(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 95
LDI r2, 117
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
