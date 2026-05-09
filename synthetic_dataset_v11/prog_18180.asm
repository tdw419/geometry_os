; DESCRIPTION: Renders a cyan line between points (186, 163) and (192, 47).
; PLAN: r0=186(x1), r1=163(y1), r2=192(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 163
LDI r2, 192
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
