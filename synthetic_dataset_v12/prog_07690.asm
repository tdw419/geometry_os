; DESCRIPTION: Places a cyan line segment connecting (49, 199) to (254, 93).
; PLAN: r0=49(x1), r1=199(y1), r2=254(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 199
LDI r2, 254
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
