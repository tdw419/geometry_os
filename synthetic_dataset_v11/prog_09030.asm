; DESCRIPTION: Draws a cyan line from (47, 2) to (98, 179).
; PLAN: r0=47(x1), r1=2(y1), r2=98(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 2
LDI r2, 98
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
