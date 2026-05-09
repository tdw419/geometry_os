; DESCRIPTION: Composite: . Then Places a blue dot at position (52, 90). Then Draws a purple line from (28, 10) to (166, 19).
; PLAN: r0=52(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=28(x1), r1=10(y1), r2=166(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (52, 90).
; PLAN: r0=52(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (28, 10) to (166, 19).
; PLAN: r0=28(x1), r1=10(y1), r2=166(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 10
LDI r2, 166
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
