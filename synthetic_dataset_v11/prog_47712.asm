; DESCRIPTION: Places a cyan line segment connecting (183, 0) to (30, 216).
; PLAN: r0=183(x1), r1=0(y1), r2=30(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 0
LDI r2, 30
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
