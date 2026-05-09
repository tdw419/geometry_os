; DESCRIPTION: Places a cyan line segment connecting (194, 120) to (199, 135).
; PLAN: r0=194(x1), r1=120(y1), r2=199(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 120
LDI r2, 199
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
