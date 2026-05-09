; DESCRIPTION: Renders a cyan line between points (78, 10) and (374, 99).
; PLAN: r0=78(x1), r1=10(y1), r2=374(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 10
LDI r2, 374
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
