; DESCRIPTION: Places a white line segment connecting (295, 14) to (156, 183).
; PLAN: r0=295(x1), r1=14(y1), r2=156(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 14
LDI r2, 156
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
