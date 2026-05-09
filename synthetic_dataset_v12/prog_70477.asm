; DESCRIPTION: Draws a cyan line from (484, 233) to (261, 89).
; PLAN: r0=484(x1), r1=233(y1), r2=261(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 233
LDI r2, 261
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
