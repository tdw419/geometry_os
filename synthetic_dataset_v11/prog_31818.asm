; DESCRIPTION: Composite: . Then Places a white line segment connecting (8, 247) to (53, 244). Then Sets a single magenta pixel at (235, 230).
; PLAN: r0=8(x1), r1=247(y1), r2=53(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=235(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (8, 247) to (53, 244).
; PLAN: r0=8(x1), r1=247(y1), r2=53(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 247
LDI r2, 53
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (235, 230).
; PLAN: r0=235(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 230
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
