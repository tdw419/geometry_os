; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (196, 1) to (215, 100). Then Sets a single blue pixel at (61, 69).
; PLAN: r0=196(x1), r1=1(y1), r2=215(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (196, 1) to (215, 100).
; PLAN: r0=196(x1), r1=1(y1), r2=215(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 1
LDI r2, 215
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (61, 69).
; PLAN: r0=61(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 69
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
