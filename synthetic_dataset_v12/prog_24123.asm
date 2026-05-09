; DESCRIPTION: Renders a cyan line between points (477, 34) and (486, 120).
; PLAN: r0=477(x1), r1=34(y1), r2=486(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 34
LDI r2, 486
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
