; DESCRIPTION: Composite: . Then Renders a purple box of size 40x120 starting at (163, 90). Then Places a magenta dot at position (22, 51).
; PLAN: r0=163(x), r1=90(y), r2=40(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=22(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple box of size 40x120 starting at (163, 90).
; PLAN: r0=163(x), r1=90(y), r2=40(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 90
LDI r2, 40
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (22, 51).
; PLAN: r0=22(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
