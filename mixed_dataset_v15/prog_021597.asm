; DESCRIPTION: Renders a cyan line between points (335, 143) and (20, 96).
; PLAN: r0=335(x1), r1=143(y1), r2=20(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 143
LDI r2, 20
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
