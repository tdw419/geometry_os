; DESCRIPTION: Renders a cyan line between points (335, 212) and (425, 7).
; PLAN: r0=335(x1), r1=212(y1), r2=425(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 212
LDI r2, 425
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
