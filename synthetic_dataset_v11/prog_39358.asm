; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (100, 2). Then Places a blue line segment connecting (2, 39) to (76, 42).
; PLAN: r0=100(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=2(x1), r1=39(y1), r2=76(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (100, 2).
; PLAN: r0=100(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (2, 39) to (76, 42).
; PLAN: r0=2(x1), r1=39(y1), r2=76(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 39
LDI r2, 76
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
