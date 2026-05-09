; DESCRIPTION: Renders a cyan line between points (34, 95) and (183, 66).
; PLAN: r0=34(x1), r1=95(y1), r2=183(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 95
LDI r2, 183
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
