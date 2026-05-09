; DESCRIPTION: Places a cyan line segment connecting (66, 20) to (248, 38).
; PLAN: r0=66(x1), r1=20(y1), r2=248(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 20
LDI r2, 248
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
