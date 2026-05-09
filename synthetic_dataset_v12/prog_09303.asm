; DESCRIPTION: Renders a cyan line between points (212, 69) and (118, 78).
; PLAN: r0=212(x1), r1=69(y1), r2=118(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 69
LDI r2, 118
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
