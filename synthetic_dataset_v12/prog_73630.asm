; DESCRIPTION: Renders a cyan line between points (232, 37) and (163, 46).
; PLAN: r0=232(x1), r1=37(y1), r2=163(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 37
LDI r2, 163
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
