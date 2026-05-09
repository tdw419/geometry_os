; DESCRIPTION: Composite: . Then Sets a single blue pixel at (32, 209). Then Draws a black line from (240, 153) to (221, 64).
; PLAN: r0=32(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=240(x1), r1=153(y1), r2=221(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (32, 209).
; PLAN: r0=32(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 209
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (240, 153) to (221, 64).
; PLAN: r0=240(x1), r1=153(y1), r2=221(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 153
LDI r2, 221
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
