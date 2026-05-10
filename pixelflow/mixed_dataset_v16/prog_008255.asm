; DESCRIPTION: Renders a cyan line between points (243, 10) and (158, 76).
; PLAN: r0=243(x1), r1=10(y1), r2=158(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 10
LDI r2, 158
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
