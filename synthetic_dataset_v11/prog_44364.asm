; DESCRIPTION: Composite: . Then Sets a single purple pixel at (32, 165). Then Places a blue line segment connecting (88, 101) to (20, 134).
; PLAN: r0=32(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=88(x1), r1=101(y1), r2=20(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (32, 165).
; PLAN: r0=32(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (88, 101) to (20, 134).
; PLAN: r0=88(x1), r1=101(y1), r2=20(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 101
LDI r2, 20
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
