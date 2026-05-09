; DESCRIPTION: Places a cyan line segment connecting (391, 52) to (66, 78).
; PLAN: r0=391(x1), r1=52(y1), r2=66(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 52
LDI r2, 66
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
