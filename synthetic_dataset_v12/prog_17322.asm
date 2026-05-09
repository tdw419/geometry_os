; DESCRIPTION: Renders a cyan line between points (212, 65) and (427, 62).
; PLAN: r0=212(x1), r1=65(y1), r2=427(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 65
LDI r2, 427
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
