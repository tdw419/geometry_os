; DESCRIPTION: Composite: . Then Draws a blue line from (119, 253) to (199, 224). Then Sets a single purple pixel at (182, 231).
; PLAN: r0=119(x1), r1=253(y1), r2=199(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=231(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (119, 253) to (199, 224).
; PLAN: r0=119(x1), r1=253(y1), r2=199(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 253
LDI r2, 199
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (182, 231).
; PLAN: r0=182(x), r1=231(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 231
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
