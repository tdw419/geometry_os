; DESCRIPTION: Renders a cyan line between points (357, 186) and (40, 160).
; PLAN: r0=357(x1), r1=186(y1), r2=40(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 186
LDI r2, 40
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
