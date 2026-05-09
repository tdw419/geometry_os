; DESCRIPTION: Composite: . Then Places a red line segment connecting (204, 119) to (50, 184). Then Sets a single magenta pixel at (117, 139).
; PLAN: r0=204(x1), r1=119(y1), r2=50(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=117(x), r1=139(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (204, 119) to (50, 184).
; PLAN: r0=204(x1), r1=119(y1), r2=50(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 119
LDI r2, 50
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (117, 139).
; PLAN: r0=117(x), r1=139(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 139
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
