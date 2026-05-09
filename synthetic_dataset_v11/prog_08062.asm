; DESCRIPTION: Composite: . Then Places a blue line segment connecting (243, 81) to (252, 2). Then Places a red dot at position (201, 37).
; PLAN: r0=243(x1), r1=81(y1), r2=252(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=201(x), r1=37(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (243, 81) to (252, 2).
; PLAN: r0=243(x1), r1=81(y1), r2=252(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 81
LDI r2, 252
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (201, 37).
; PLAN: r0=201(x), r1=37(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 37
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
