; DESCRIPTION: Composite: . Then Places a green line segment connecting (98, 1) to (129, 116). Then Places a red dot at position (128, 76).
; PLAN: r0=98(x1), r1=1(y1), r2=129(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (98, 1) to (129, 116).
; PLAN: r0=98(x1), r1=1(y1), r2=129(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 1
LDI r2, 129
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (128, 76).
; PLAN: r0=128(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
