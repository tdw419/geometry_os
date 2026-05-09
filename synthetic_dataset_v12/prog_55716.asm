; DESCRIPTION: Places a cyan line segment connecting (189, 156) to (108, 152).
; PLAN: r0=189(x1), r1=156(y1), r2=108(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 156
LDI r2, 108
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
