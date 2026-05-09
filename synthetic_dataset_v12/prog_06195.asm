; DESCRIPTION: Renders a cyan line between points (484, 9) and (121, 71).
; PLAN: r0=484(x1), r1=9(y1), r2=121(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 9
LDI r2, 121
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
