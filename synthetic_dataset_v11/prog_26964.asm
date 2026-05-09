; DESCRIPTION: Places a green line segment connecting (52, 138) to (233, 95).
; PLAN: r0=52(x1), r1=138(y1), r2=233(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 138
LDI r2, 233
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
