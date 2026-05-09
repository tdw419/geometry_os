; DESCRIPTION: Places a cyan line segment connecting (4, 99) to (272, 211).
; PLAN: r0=4(x1), r1=99(y1), r2=272(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 99
LDI r2, 272
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
