; DESCRIPTION: Places a yellow line segment connecting (93, 27) to (121, 118).
; PLAN: r0=93(x1), r1=27(y1), r2=121(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 27
LDI r2, 121
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
