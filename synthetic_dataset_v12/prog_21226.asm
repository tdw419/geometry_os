; DESCRIPTION: Renders a cyan line between points (335, 246) and (83, 195).
; PLAN: r0=335(x1), r1=246(y1), r2=83(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 246
LDI r2, 83
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
