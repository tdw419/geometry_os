; DESCRIPTION: Renders a cyan line between points (118, 40) and (49, 153).
; PLAN: r0=118(x1), r1=40(y1), r2=49(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 40
LDI r2, 49
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
