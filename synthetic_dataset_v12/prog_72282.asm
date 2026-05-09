; DESCRIPTION: Draws a cyan line from (83, 157) to (314, 68).
; PLAN: r0=83(x1), r1=157(y1), r2=314(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 157
LDI r2, 314
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
