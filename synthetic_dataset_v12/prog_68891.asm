; DESCRIPTION: Renders a cyan line between points (76, 116) and (157, 102).
; PLAN: r0=76(x1), r1=116(y1), r2=157(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 116
LDI r2, 157
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
