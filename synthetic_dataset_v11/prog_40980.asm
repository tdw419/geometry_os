; DESCRIPTION: Renders a cyan line between points (177, 208) and (54, 34).
; PLAN: r0=177(x1), r1=208(y1), r2=54(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 208
LDI r2, 54
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
