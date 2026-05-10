; DESCRIPTION: Places a cyan line segment connecting (110, 85) to (39, 33).
; PLAN: r0=110(x1), r1=85(y1), r2=39(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 85
LDI r2, 39
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
