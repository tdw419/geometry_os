; DESCRIPTION: Places a cyan line segment connecting (252, 105) to (102, 95).
; PLAN: r0=252(x1), r1=105(y1), r2=102(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 105
LDI r2, 102
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
