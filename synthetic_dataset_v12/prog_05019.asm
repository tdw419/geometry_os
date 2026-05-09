; DESCRIPTION: Places a cyan line segment connecting (193, 143) to (199, 250).
; PLAN: r0=193(x1), r1=143(y1), r2=199(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 143
LDI r2, 199
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
