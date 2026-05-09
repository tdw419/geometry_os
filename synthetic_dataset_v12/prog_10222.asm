; DESCRIPTION: Places a cyan line segment connecting (403, 105) to (83, 3).
; PLAN: r0=403(x1), r1=105(y1), r2=83(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 105
LDI r2, 83
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
