; DESCRIPTION: Draws a cyan line from (221, 96) to (457, 110).
; PLAN: r0=221(x1), r1=96(y1), r2=457(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 96
LDI r2, 457
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
