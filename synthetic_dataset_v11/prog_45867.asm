; DESCRIPTION: Renders a cyan line between points (212, 58) and (93, 172).
; PLAN: r0=212(x1), r1=58(y1), r2=93(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 58
LDI r2, 93
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
