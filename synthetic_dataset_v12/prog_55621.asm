; DESCRIPTION: Places a green line segment connecting (182, 57) to (134, 76).
; PLAN: r0=182(x1), r1=57(y1), r2=134(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 57
LDI r2, 134
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
