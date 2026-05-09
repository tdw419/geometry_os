; DESCRIPTION: Places a cyan line segment connecting (454, 188) to (199, 3).
; PLAN: r0=454(x1), r1=188(y1), r2=199(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 188
LDI r2, 199
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
