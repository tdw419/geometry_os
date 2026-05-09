; DESCRIPTION: Places a cyan line segment connecting (156, 47) to (234, 31).
; PLAN: r0=156(x1), r1=47(y1), r2=234(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 47
LDI r2, 234
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
