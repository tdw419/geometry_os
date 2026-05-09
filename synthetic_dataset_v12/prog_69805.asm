; DESCRIPTION: Renders a cyan line between points (357, 99) and (77, 188).
; PLAN: r0=357(x1), r1=99(y1), r2=77(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 99
LDI r2, 77
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
