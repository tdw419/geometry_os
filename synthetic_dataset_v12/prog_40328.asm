; DESCRIPTION: Draws a cyan line from (462, 158) to (23, 156).
; PLAN: r0=462(x1), r1=158(y1), r2=23(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 158
LDI r2, 23
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
