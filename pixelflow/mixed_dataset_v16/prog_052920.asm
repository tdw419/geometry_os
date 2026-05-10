; DESCRIPTION: Places a cyan line segment connecting (26, 134) to (373, 76).
; PLAN: r0=26(x1), r1=134(y1), r2=373(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 134
LDI r2, 373
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
