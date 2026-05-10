; DESCRIPTION: Places a cyan line segment connecting (271, 56) to (272, 199).
; PLAN: r0=271(x1), r1=56(y1), r2=272(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 56
LDI r2, 272
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
