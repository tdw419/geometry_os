; DESCRIPTION: Places a red line segment connecting (365, 254) to (31, 213).
; PLAN: r0=365(x1), r1=254(y1), r2=31(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 254
LDI r2, 31
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
