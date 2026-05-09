; DESCRIPTION: Renders a cyan line between points (76, 236) and (335, 176).
; PLAN: r0=76(x1), r1=236(y1), r2=335(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 236
LDI r2, 335
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
