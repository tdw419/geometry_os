; DESCRIPTION: Renders a cyan line between points (315, 134) and (149, 255).
; PLAN: r0=315(x1), r1=134(y1), r2=149(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 134
LDI r2, 149
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
