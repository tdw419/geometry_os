; DESCRIPTION: Places a cyan line segment connecting (343, 52) to (222, 29).
; PLAN: r0=343(x1), r1=52(y1), r2=222(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 52
LDI r2, 222
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
