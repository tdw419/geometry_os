; DESCRIPTION: Places a cyan line segment connecting (381, 112) to (342, 232).
; PLAN: r0=381(x1), r1=112(y1), r2=342(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 112
LDI r2, 342
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
