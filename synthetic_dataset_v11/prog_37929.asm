; DESCRIPTION: Places a green line segment connecting (199, 128) to (91, 87).
; PLAN: r0=199(x1), r1=128(y1), r2=91(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 128
LDI r2, 91
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
