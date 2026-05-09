; DESCRIPTION: Renders a cyan line between points (136, 0) and (116, 212).
; PLAN: r0=136(x1), r1=0(y1), r2=116(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 0
LDI r2, 116
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
