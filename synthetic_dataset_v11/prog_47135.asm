; DESCRIPTION: Places a cyan line segment connecting (138, 150) to (30, 216).
; PLAN: r0=138(x1), r1=150(y1), r2=30(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 150
LDI r2, 30
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
