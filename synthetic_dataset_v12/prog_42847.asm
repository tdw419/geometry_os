; DESCRIPTION: Renders a cyan line between points (349, 156) and (334, 7).
; PLAN: r0=349(x1), r1=156(y1), r2=334(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 156
LDI r2, 334
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
