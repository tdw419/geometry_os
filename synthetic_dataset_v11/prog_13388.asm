; DESCRIPTION: Places a cyan line segment connecting (194, 211) to (33, 183).
; PLAN: r0=194(x1), r1=211(y1), r2=33(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 211
LDI r2, 33
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
