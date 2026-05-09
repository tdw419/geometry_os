; DESCRIPTION: Places a cyan line segment connecting (7, 251) to (69, 66).
; PLAN: r0=7(x1), r1=251(y1), r2=69(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 251
LDI r2, 69
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
