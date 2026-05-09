; DESCRIPTION: Renders a cyan line between points (118, 82) and (188, 19).
; PLAN: r0=118(x1), r1=82(y1), r2=188(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 82
LDI r2, 188
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
