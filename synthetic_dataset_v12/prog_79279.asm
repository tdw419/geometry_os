; DESCRIPTION: Places a cyan line segment connecting (152, 105) to (158, 199).
; PLAN: r0=152(x1), r1=105(y1), r2=158(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 105
LDI r2, 158
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
