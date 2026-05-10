; DESCRIPTION: Places a white line segment connecting (511, 32) to (31, 108).
; PLAN: r0=511(x1), r1=32(y1), r2=31(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 32
LDI r2, 31
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
