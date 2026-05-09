; DESCRIPTION: Places a cyan line segment connecting (191, 251) to (106, 58).
; PLAN: r0=191(x1), r1=251(y1), r2=106(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 251
LDI r2, 106
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
