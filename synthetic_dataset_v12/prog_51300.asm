; DESCRIPTION: Places a cyan line segment connecting (110, 124) to (391, 75).
; PLAN: r0=110(x1), r1=124(y1), r2=391(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 124
LDI r2, 391
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
