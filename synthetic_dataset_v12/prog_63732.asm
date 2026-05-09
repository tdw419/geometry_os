; DESCRIPTION: Places a cyan line segment connecting (332, 127) to (341, 183).
; PLAN: r0=332(x1), r1=127(y1), r2=341(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 127
LDI r2, 341
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
