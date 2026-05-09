; DESCRIPTION: Renders a cyan line between points (55, 31) and (163, 135).
; PLAN: r0=55(x1), r1=31(y1), r2=163(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 31
LDI r2, 163
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
