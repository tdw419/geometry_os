; DESCRIPTION: Places a cyan line segment connecting (506, 98) to (77, 201).
; PLAN: r0=506(x1), r1=98(y1), r2=77(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 98
LDI r2, 77
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
