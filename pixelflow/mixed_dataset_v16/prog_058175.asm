; DESCRIPTION: Places a cyan line segment connecting (121, 14) to (93, 29).
; PLAN: r0=121(x1), r1=14(y1), r2=93(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 14
LDI r2, 93
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
