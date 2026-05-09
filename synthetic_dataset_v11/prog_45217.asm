; DESCRIPTION: Renders a cyan line between points (188, 74) and (102, 158).
; PLAN: r0=188(x1), r1=74(y1), r2=102(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 74
LDI r2, 102
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
