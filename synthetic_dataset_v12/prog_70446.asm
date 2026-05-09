; DESCRIPTION: Renders a cyan line between points (156, 144) and (238, 102).
; PLAN: r0=156(x1), r1=144(y1), r2=238(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 144
LDI r2, 238
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
