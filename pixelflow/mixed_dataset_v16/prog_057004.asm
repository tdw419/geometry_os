; DESCRIPTION: Places a cyan line segment connecting (388, 180) to (355, 52).
; PLAN: r0=388(x1), r1=180(y1), r2=355(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 180
LDI r2, 355
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
