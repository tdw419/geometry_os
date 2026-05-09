; DESCRIPTION: Composite: . Then Places a magenta dot at position (22, 110). Then Places a blue line segment connecting (28, 11) to (170, 215).
; PLAN: r0=22(x), r1=110(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=28(x1), r1=11(y1), r2=170(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (22, 110).
; PLAN: r0=22(x), r1=110(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 110
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (28, 11) to (170, 215).
; PLAN: r0=28(x1), r1=11(y1), r2=170(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 11
LDI r2, 170
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
