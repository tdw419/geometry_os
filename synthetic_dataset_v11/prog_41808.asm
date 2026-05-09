; DESCRIPTION: Places a green line segment connecting (102, 238) to (241, 234).
; PLAN: r0=102(x1), r1=238(y1), r2=241(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 238
LDI r2, 241
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
