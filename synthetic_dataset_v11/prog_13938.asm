; DESCRIPTION: Renders a cyan line between points (78, 61) and (149, 231).
; PLAN: r0=78(x1), r1=61(y1), r2=149(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 61
LDI r2, 149
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
