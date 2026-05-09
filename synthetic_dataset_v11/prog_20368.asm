; DESCRIPTION: Renders a cyan line between points (79, 76) and (246, 35).
; PLAN: r0=79(x1), r1=76(y1), r2=246(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 76
LDI r2, 246
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
