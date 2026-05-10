; DESCRIPTION: Renders a cyan line between points (264, 45) and (156, 185).
; PLAN: r0=264(x1), r1=45(y1), r2=156(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 45
LDI r2, 156
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
