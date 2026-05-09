; DESCRIPTION: Renders a cyan line between points (301, 95) and (149, 117).
; PLAN: r0=301(x1), r1=95(y1), r2=149(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 95
LDI r2, 149
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
