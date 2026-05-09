; DESCRIPTION: Draws a cyan line from (124, 156) to (55, 97).
; PLAN: r0=124(x1), r1=156(y1), r2=55(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 156
LDI r2, 55
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
