; DESCRIPTION: Places a cyan line segment connecting (148, 14) to (158, 209).
; PLAN: r0=148(x1), r1=14(y1), r2=158(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 14
LDI r2, 158
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
