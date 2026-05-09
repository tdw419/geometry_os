; DESCRIPTION: Places a cyan line segment connecting (189, 102) to (454, 181).
; PLAN: r0=189(x1), r1=102(y1), r2=454(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 102
LDI r2, 454
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
