; DESCRIPTION: Places a cyan line segment connecting (148, 99) to (261, 211).
; PLAN: r0=148(x1), r1=99(y1), r2=261(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 99
LDI r2, 261
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
