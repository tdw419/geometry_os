; DESCRIPTION: Draws a cyan line from (160, 104) to (311, 77).
; PLAN: r0=160(x1), r1=104(y1), r2=311(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 104
LDI r2, 311
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
