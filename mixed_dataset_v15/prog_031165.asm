; DESCRIPTION: Places a cyan line segment connecting (360, 19) to (36, 76).
; PLAN: r0=360(x1), r1=19(y1), r2=36(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 19
LDI r2, 36
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
