; DESCRIPTION: Places a cyan line segment connecting (421, 248) to (227, 183).
; PLAN: r0=421(x1), r1=248(y1), r2=227(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 248
LDI r2, 227
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
