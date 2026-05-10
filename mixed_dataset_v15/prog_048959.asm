; DESCRIPTION: Renders a cyan line between points (68, 246) and (282, 79).
; PLAN: r0=68(x1), r1=246(y1), r2=282(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 246
LDI r2, 282
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
