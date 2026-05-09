; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (123, 139) to (225, 53). Then Sets a single white pixel at (119, 5).
; PLAN: r0=123(x1), r1=139(y1), r2=225(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=119(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (123, 139) to (225, 53).
; PLAN: r0=123(x1), r1=139(y1), r2=225(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 139
LDI r2, 225
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (119, 5).
; PLAN: r0=119(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
