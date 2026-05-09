; DESCRIPTION: Composite: . Then Sets a single white pixel at (76, 143). Then Places a purple line segment connecting (164, 226) to (113, 215).
; PLAN: r0=76(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=164(x1), r1=226(y1), r2=113(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (76, 143).
; PLAN: r0=76(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 143
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (164, 226) to (113, 215).
; PLAN: r0=164(x1), r1=226(y1), r2=113(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 226
LDI r2, 113
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
