; DESCRIPTION: Renders a cyan line between points (91, 31) and (239, 201).
; PLAN: r0=91(x1), r1=31(y1), r2=239(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 31
LDI r2, 239
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
