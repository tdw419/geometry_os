; DESCRIPTION: Renders a cyan line between points (484, 30) and (240, 161).
; PLAN: r0=484(x1), r1=30(y1), r2=240(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 30
LDI r2, 240
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
