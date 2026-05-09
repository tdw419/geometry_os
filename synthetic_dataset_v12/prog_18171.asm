; DESCRIPTION: Renders a cyan line between points (83, 61) and (49, 54).
; PLAN: r0=83(x1), r1=61(y1), r2=49(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 61
LDI r2, 49
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
