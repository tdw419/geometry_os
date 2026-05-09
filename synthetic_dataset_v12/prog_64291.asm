; DESCRIPTION: Places a cyan line segment connecting (58, 252) to (487, 72).
; PLAN: r0=58(x1), r1=252(y1), r2=487(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 252
LDI r2, 487
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
