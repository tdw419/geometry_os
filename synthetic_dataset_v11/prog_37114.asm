; DESCRIPTION: Composite: . Then Places a black line segment connecting (49, 152) to (113, 173). Then Sets a single magenta pixel at (39, 13).
; PLAN: r0=49(x1), r1=152(y1), r2=113(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=39(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (49, 152) to (113, 173).
; PLAN: r0=49(x1), r1=152(y1), r2=113(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 152
LDI r2, 113
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (39, 13).
; PLAN: r0=39(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 13
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
