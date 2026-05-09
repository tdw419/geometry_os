; DESCRIPTION: Composite: . Then Places a green line segment connecting (238, 246) to (192, 4). Then Sets a single magenta pixel at (95, 248).
; PLAN: r0=238(x1), r1=246(y1), r2=192(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=248(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (238, 246) to (192, 4).
; PLAN: r0=238(x1), r1=246(y1), r2=192(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 246
LDI r2, 192
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (95, 248).
; PLAN: r0=95(x), r1=248(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 248
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
