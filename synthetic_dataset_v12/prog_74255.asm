; DESCRIPTION: Draws a cyan line from (276, 83) to (216, 78).
; PLAN: r0=276(x1), r1=83(y1), r2=216(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 83
LDI r2, 216
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
