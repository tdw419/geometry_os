; DESCRIPTION: Renders a cyan line between points (195, 170) and (38, 91).
; PLAN: r0=195(x1), r1=170(y1), r2=38(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 170
LDI r2, 38
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
