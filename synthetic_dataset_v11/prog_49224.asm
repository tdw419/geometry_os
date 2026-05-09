; DESCRIPTION: Composite: . Then Sets a single blue pixel at (213, 168). Then Renders a purple box of size 73x84 starting at (162, 126).
; PLAN: r0=213(x), r1=168(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=162(x), r1=126(y), r2=73(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (213, 168).
; PLAN: r0=213(x), r1=168(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 168
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 73x84 starting at (162, 126).
; PLAN: r0=162(x), r1=126(y), r2=73(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 126
LDI r2, 73
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
