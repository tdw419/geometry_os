; DESCRIPTION: Composite: . Then Places a blue line segment connecting (48, 240) to (49, 129). Then Places a magenta dot at position (3, 205).
; PLAN: r0=48(x1), r1=240(y1), r2=49(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=3(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (48, 240) to (49, 129).
; PLAN: r0=48(x1), r1=240(y1), r2=49(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 240
LDI r2, 49
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (3, 205).
; PLAN: r0=3(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 205
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
