; DESCRIPTION: Places a green line segment connecting (195, 31) to (226, 21).
; PLAN: r0=195(x1), r1=31(y1), r2=226(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 31
LDI r2, 226
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
