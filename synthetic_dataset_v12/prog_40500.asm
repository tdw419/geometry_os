; DESCRIPTION: Places a cyan line segment connecting (61, 204) to (343, 34).
; PLAN: r0=61(x1), r1=204(y1), r2=343(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 204
LDI r2, 343
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
