; DESCRIPTION: Places a cyan line segment connecting (57, 0) to (153, 218).
; PLAN: r0=57(x1), r1=0(y1), r2=153(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 0
LDI r2, 153
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
