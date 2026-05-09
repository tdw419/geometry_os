; DESCRIPTION: Places a cyan line segment connecting (155, 35) to (95, 81).
; PLAN: r0=155(x1), r1=35(y1), r2=95(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 35
LDI r2, 95
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
