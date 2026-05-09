; DESCRIPTION: Composite: . Then Draws a black line from (197, 62) to (144, 247). Then Sets a single blue pixel at (63, 36).
; PLAN: r0=197(x1), r1=62(y1), r2=144(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=63(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (197, 62) to (144, 247).
; PLAN: r0=197(x1), r1=62(y1), r2=144(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 62
LDI r2, 144
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (63, 36).
; PLAN: r0=63(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 36
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
