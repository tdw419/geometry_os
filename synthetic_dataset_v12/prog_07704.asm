; DESCRIPTION: Renders a cyan line between points (498, 89) and (280, 118).
; PLAN: r0=498(x1), r1=89(y1), r2=280(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 89
LDI r2, 280
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
