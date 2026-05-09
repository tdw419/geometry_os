; DESCRIPTION: Draws a cyan line from (484, 225) to (229, 205).
; PLAN: r0=484(x1), r1=225(y1), r2=229(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 225
LDI r2, 229
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
