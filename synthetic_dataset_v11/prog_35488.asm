; DESCRIPTION: Composite: . Then Places a yellow dot at position (151, 40). Then Places a red line segment connecting (184, 28) to (185, 33).
; PLAN: r0=151(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=184(x1), r1=28(y1), r2=185(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (151, 40).
; PLAN: r0=151(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (184, 28) to (185, 33).
; PLAN: r0=184(x1), r1=28(y1), r2=185(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 28
LDI r2, 185
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
