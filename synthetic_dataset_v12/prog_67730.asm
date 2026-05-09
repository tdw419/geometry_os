; DESCRIPTION: Renders a cyan line between points (109, 193) and (357, 149).
; PLAN: r0=109(x1), r1=193(y1), r2=357(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 193
LDI r2, 357
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
