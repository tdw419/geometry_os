; DESCRIPTION: Draws a cyan line from (11, 91) to (96, 106).
; PLAN: r0=11(x1), r1=91(y1), r2=96(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 91
LDI r2, 96
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
